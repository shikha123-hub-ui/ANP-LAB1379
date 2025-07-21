const fs = require('fs');
const path = require('path');

// File paths
const file1 = path.join(__dirname, 'file1.txt');
const file2 = path.join(__dirname, 'file2.txt');
const mergedFile = path.join(__dirname, 'merged.txt');

// Check if both files exist
if (fs.existsSync(file1) && fs.existsSync(file2)) {
  // Read contents of both files
  const content1 = fs.readFileSync(file1, 'utf8');
  const content2 = fs.readFileSync(file2, 'utf8');

  // Merge contents
  const mergedContent = content1 + '\n' + content2;

  // Write to merged.txt
  fs.writeFileSync(mergedFile, mergedContent);

  console.log('Files merged successfully into "merged.txt".');
} else {
  console.log('One or both source files do not exist.');
}
