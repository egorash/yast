class DeviceImagesUtil {
  static final Map<String, String> _images = {
    "devices.types.smart_speaker.yandex.station.mini":
        "https://yastatic.net/s3/frontend/quasar/_/c82c948219d5023c848cd490db7d0856.png",
    "devices.types.smart_speaker.yandex.station.midi":
        "https://yastatic.net/s3/frontend/quasar/_/a946b26503926c11ad8df9cc81b03ca4.png",
    "devices.types.smart_speaker.yandex.station_2":
        "https://yastatic.net/s3/frontend/quasar/_/a946b26503926c11ad8df9cc81b03ca4.png",
    "devices.types.light":
        "https://yastatic.net/s3/frontend/quasar/_/93aaba7dd1c794feda4e6934bdbe8ee2.svg",
    "devices.types.socket":
        "https://yastatic.net/s3/frontend/quasar/_/53438b6b5b887b30743c2ad20cfd06c5.svg",
    "devices.types.humidifier":
        "https://yastatic.net/s3/frontend/quasar/_/9ae1088b5a07c7efaa389a9b89afa1b1.svg",
    "devices.types.sensor":
        "https://yastatic.net/s3/frontend/quasar/_/b7590333c5c0dfe421554f08d3e46d89.svg",
    "devices.types.switch":
        "https://yastatic.net/s3/frontend/quasar/_/b7590333c5c0dfe421554f08d3e46d89.svg",
  };

  static getImage(String type) {
    return _images[type];
  }
}
