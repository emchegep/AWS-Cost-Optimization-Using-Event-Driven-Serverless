#!/bin/bash

# Package the lambda code
# Create a zip file

echo "🚀 Starting packaging process......"

# Clean up the previous zip file
echo "🚮 Cleaning up existing zip file"
rm -f lambda_package.zip

# Package Lambda code
echo "📦 Packaging lambda code....."
zip -r lambda_package.zip src/
echo "✅ Lambda code packaged successfully"

echo "🎉 Packaging complete!"
echo "📁 Generated files:"
echo "- lambda_package.zip"