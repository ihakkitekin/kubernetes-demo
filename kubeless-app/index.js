module.exports = {
  echo: function (event, context) {
    console.log('context ------>', JSON.stringify(context, null, 4));
    console.log('event.data ------>', JSON.stringify(event.data, null, 4));

    return event.data;
  }
}