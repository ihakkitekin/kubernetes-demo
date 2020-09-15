const { hello } = require('./hello')

module.exports = {
  echo: function (event, context) {
    console.log('context ------>', JSON.stringify(context, null, 4));
    console.log('event.extensions.request.query ------>', JSON.stringify(event.extensions.request.query, null, 4));

    return hello;
  }
}