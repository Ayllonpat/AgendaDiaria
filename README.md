# Agenda Diaria - Flutter App

## Descripción

Agenda Diaria es una app educativa para que padres visualicen las actividades diarias de sus hijos, filtrando por hijo y categoría. Está desarrollada en Flutter con diseño responsive para móvil y web.

## Características

- Selector desplegable para elegir hijo o mostrar todos.
- Menú horizontal scrollable con categorías: Alimentación, Siestas, Actividades, Deposiciones, Observaciones.
- Tarjetas con foto (desde API gratuita randomuser.me), nombre, hora y descripción de cada evento.
- Datos simulados estáticos en JSON.
- Gestión de estado con Provider.
- Diseño limpio y adaptable.
- Test automático incluido.

## Captura

![image](https://github.com/user-attachments/assets/fec119c2-9b33-404f-b40b-14f9f932495a)
![image](https://github.com/user-attachments/assets/9a75fd03-ec02-4a74-9bb5-4bb87dc0bdf2)

## Estructura

 - lib/models/: Modelos de datos.
 - lib/providers/: Lógica y estado con Provider.
 - lib/screens/: Pantallas principales.
 - lib/widgets/: Widgets reutilizables.
 - test/: Tests automáticos.

## Test

Se incluye un test para la función getColorById que:
 - Verifica que dada una ID de hijo devuelve el color correcto asociado.
 - Garantiza que la lógica de asignación de colores por hijo funciona correctamente.
Para ejecutar los tests:

```bash
flutter test
```

## Instalación

```bash
git clone https://github.com/Ayllonpat/AgendaDiaria.git
cd AgendaDiaria
flutter pub get
flutter run -d chrome    # Para web
# O
flutter run              # Para móvil
