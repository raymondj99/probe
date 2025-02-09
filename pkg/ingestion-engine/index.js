const ingestion = require("bindings")("ingestion");

module.exports = {
  startServer: ingestion.startServer,
};
