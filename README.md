# kde.feveal.meteo (v1.0)

**A KDE Plasmoid for weather data powered by [Meteoblue](https://www.meteoblue.com/)**

This plasmoid fetches weather information using a public script from the Meteoblue website.

To configure your location, visit the Meteoblue website and search for the desired location. In the address bar, copy the last part of the URL — it typically looks like `city_country_code`, for example:
`madrid_spain_3117735`.

In the plasmoid, click the star icon button to open the input dialog. Paste the location code there.

⚠️ **Important:** Do not include a slash (`/`) in the location code, as it may break the display.

Once a location is set, a small weather preview will appear, showing the city, current temperature, and conditions. Clicking the image expands the view to show forecasts for upcoming days — accessible via tabs.

---

## 📷 Screenshots

![Screenshot 1](https://github.com/feveal/kde.feveal.meteo/blob/main/Screenshot_meteoblue_1.png)
![Screenshot 2](https://github.com/feveal/kde.feveal.meteo/blob/main/Screenshot_meteoblue_2.png)

---

## 🚀 Getting Started

1. **Unzip the downloaded archive.**
2. Inside the unzipped folder, locate the file: `install_plasmoid.sh`.
3. Give execute permissions for this file
4. Open a terminal in that folder and run:

   ```bash
   ./install_plasmoid.sh
   ```

4. The plasmoid will be installed to:
   `~/.local/share/plasma/plasmoids/kde.feveal.meteo/`

Once installed, it will be available alongside your other system widgets.

---

## 🧹 Description

A simple and clean plasmoid for the KDE Plasma Desktop to display weather data from Meteoblue.

**Version:** 1.0

---

## 👤 Author

Fernando Vélez
📧 feveal@hotmail.com

---

## 📍 License

This project is open source. Licensed under the **GPLv3** or later.
See the `LICENSE` file for full details.

