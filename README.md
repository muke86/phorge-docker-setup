
# 🐘 Phorge Docker „Survivor Edition“ 🚢

> **Deutsch / English below.**  
> Wer das hier liest, hat vermutlich schon 17 andere Installationsversuche überlebt. Willkommen im Klub.

---

## 🚀 Willkommen zu Phorge in Docker (der *wirklich* läuft)

Endlich ein Docker-Setup für Phorge, das  
- nicht auf einem obskuren russischen GitHub-Fork basiert,
- kein Copy-Paste-Blogartikel aus 2019 ist,
- und wo du nach dem Starten **wirklich** ein Webinterface siehst –  
  und nicht 7 Stunden lang „Request parameter '__path__' is not set“!

### Was ist das?

Ein vollautomatisiertes Setup für Phorge, das auf jeder Windows- oder Linux-Kiste läuft –  
getestet, geflucht, gefeiert. Kein Community-Image-Gefrickel. Keine Copy-Paste-Dead-Ends.  
Nur echtes Überlebenstraining.

---

## 📝 TL;DR – Schnellstart (Für Eilige und Lebensmüde)

```bash
git clone https://github.com/<DEIN-GITHUB>/phorge-docker.git
cd phorge-docker
# Achtung! Hosts-Datei einrichten (siehe unten), sonst gibt's den „Host Header“-Horror
docker-compose build
docker-compose up -d
```

Öffne dann [http://phorge.localdomain:8089](http://phorge.localdomain:8089) im Browser  
(oder lies die README bis zu Ende, wenn du noch Hoffnung in die Menschheit hast).

---

## 🤬 Stolpersteine, die du kennen solltest

1. **Rewrite Rules & .htaccess**  
   Ohne eigene `.htaccess` bist du im Phorge-Limbo. Die Datei liegt hier schon drin. Du bist safe.

2. **MySQL/MariaDB**  
   Service heißt in Docker „mariadb“, nicht „localhost“ (wie es Phorge so gern hätte).  
   Zugangsdaten werden automatisch gesetzt – kein Handarbeit nötig. (Du bist schließlich nicht im Mittelalter.)

3. **BASE-URI**  
   Phorge hasst „localhost“.  
   Nutze z. B. `phorge.localdomain` und trag das in deine hosts-Datei ein.  
   (Google, warum. Spoiler: Cookies und Host-Header.)

4. **Windows und Docker?**  
   Geht! Aber du brauchst Schreibrechte auf `C:\Windows\System32\drivers\etc\hosts`  
   (am besten als Admin starten, oder den Rechner aus dem Fenster werfen).

---

## 🤡 Die Hosts-Datei (Windows)

Ohne Punkt im Hostnamen lacht dich Phorge nur aus.  
Füge ein (als Admin!):

```
127.0.0.1   phorge.localdomain
```

Speichern, Browser neu starten, das Leben wieder lieben.

---

## 🙈 Troubleshooting

- **Immer noch „Request parameter '__path__' is not set“?**  
  → Docker-Build versemmelt, .htaccess fehlt, mod_rewrite ist beleidigt.
- **Datenbankverbindung will nicht?**  
  → Docker Compose richtig? DB läuft? Zugangsdaten wie im `docker-compose.yml`?
- **Host Header Fehler?**  
  → hosts-Datei gesetzt? BASE-URI stimmt?

**Erst heulen, dann googlen, dann ein Issue eröffnen.**

---

## ☕ Buy me a coffee
Oder schick ein Carepaket. Du wirst es brauchen.  
[Kauf mir einen Kaffee](https://buymeacoffee.com/mukeber)

---

# 🦄 Phorge Docker „Survivor Edition“ (English)

> If you’re reading this, you’ve probably survived at least 17 failed Phorge/Phabricator Docker installs. Congratulations, you’ve made it to the final boss.

---

## 🚀 Why this repo exists

- Not based on some shady Russian GitHub fork.
- Not a copy-paste from a blog last updated before COVID.
- Actually produces a web interface on first try (!!!) –  
  instead of a 7-hour marathon of “Request parameter '__path__' is not set”.

---

## 📝 TL;DR – For the burnt-out, desperate, or brave

```bash
git clone https://github.com/<YOUR-GITHUB>/phorge-docker.git
cd phorge-docker
# Don’t forget the hosts file (see below) – or you’ll get Host Header Hell
docker-compose build
docker-compose up -d
```

Then visit: [http://phorge.localdomain:8089](http://phorge.localdomain:8089)  
(Or read to the end if you still have faith in humanity.)

---

## 🤬 Pain Points – So you don’t have to suffer

1. **Rewrite Rules & .htaccess**  
   No `.htaccess` = No happiness.  
   Ours is here. You’re welcome.

2. **MySQL/MariaDB**  
   The service is called “mariadb” in Docker, not “localhost”.  
   Credentials are set _automagically_.  
   (No more manual CLI wizardry – you’re not a caveman.)

3. **BASE-URI**  
   Phorge hates “localhost”.  
   Use `phorge.localdomain` and add it to your hosts file.  
   (Why? Host headers. Cookies. Suffering.)

4. **Windows & Docker?**  
   Yes, it works! Just edit your hosts file as Administrator.  
   Or throw your computer out the window. Whatever works for you.

---

## 🤡 The hosts file (Windows)

Phorge only respects hostnames with a dot.  
Add this as Admin:

```
127.0.0.1   phorge.localdomain
```

Save, restart your browser, fall back in love with software.

---

## 🙈 Troubleshooting

- **Still “Request parameter '__path__' is not set”?**  
  → Docker build botched, .htaccess missing, mod_rewrite is on strike.
- **DB connection fails?**  
  → Is Compose right? DB running? Credentials match `docker-compose.yml`?
- **Host Header error?**  
  → Did you set your hosts file? Does your BASE-URI match?

**Cry, Google, open an Issue, repeat.**

---

## ☕ Buy me a coffee
Or send a care package. You’ll need it.  
[Buy me a coffee](https://buymeacoffee.com/mukeber)

---

## **License:**  
MIT. Oder Copy-Paste, mir doch egal.  
Wer’s besser macht, bitte Fork und PR,  
aber bitte nie wieder Dead-Ends ohne README!

