#!/bin/sh

# Initialize the profile variable
profile=""
bucketpath="s3://udagram-s3bucket-90821317/"

# Iterate over the arguments
while [ "$#" -gt 0 ]; do
  case "$1" in
    --profile) # When --profile is found
      if [ -n "$2" ]; then
        case "$2" in
          -*) 
            echo "Error: Argument for $1 is missing" >&2
            exit 1
            ;;
          *) 
            profile="$2"
            shift 2
            ;;
        esac
      else
        echo "Error: Argument for $1 is missing" >&2
        exit 1
      fi
      ;;
    --bucketpath) # When --bucketpath is found
      if [ -n "$2" ]; then
        case "$2" in
          -*) 
            echo "Error: Argument for $1 is missing" >&2
            exit 1
            ;;
          *) 
            bucketpath="$2"
            shift 2
            ;;
        esac
      else
        echo "Error: Argument for $1 is missing" >&2
        exit 1
      fi
      ;;
    *) # Handle case of an unknown option or preserve positional arguments if needed
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
  esac
done

# Use the profile variable
if [ -n "$profile" ]; then
    aws s3 cp index.html "$bucketpath" --profile $profile
else
    aws s3 cp index.html "$bucketpath" 
fi

