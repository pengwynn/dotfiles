module.exports = function(results) {
  return results
    .filter(result => result.messages.length > 0)
    .map(result => result.filePath)
    .join("\n");
};
