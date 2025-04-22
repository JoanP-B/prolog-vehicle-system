# Vehicle Sales Management System - Prolog

**EAFIT University – Programming Languages**  
**Practice II – March 2025**  
**Professor: Alexander Narváez Berrío**  

---

## 🚗 Descripción

Este proyecto consiste en un sistema de gestión de ventas de vehículos implementado en **Prolog**, como parte de la práctica II del curso de Lenguajes de Programación. El sistema permite:

- Registrar un catálogo de vehículos con sus atributos clave (marca, referencia, tipo, precio y año).
- Consultar vehículos por filtros como tipo y presupuesto.
- Agrupar vehículos por marca o tipo.
- Generar reportes que respetan restricciones de presupuesto individual y total.
- Validar si el inventario excede un valor límite.

---

## 📂 Contenido del repositorio

- `vehicle_catalog.pl` → Código Prolog con las partes 1 a 4 implementadas.
- `Documentacion.pdf` → Explicación detallada del funcionamiento del sistema.
- `consultas.png` / `resultados.png` → Capturas de las consultas de prueba ejecutadas.
- `video_link.txt` → Enlace al video demostrativo de la práctica.

---

## ▶️ Cómo ejecutar el sistema

1. Abre **SWI-Prolog** u otro entorno compatible.
2. Carga el archivo con:
   ```prolog
   ?- [vehicle_catalog].
   
Ejecuta consultas como:

?- meet_budget(corolla, 25000).
?- refs_by_brand(toyota, Refs).
?- generate_report(toyota, suv, 30000, 100000, Result).
?- check_total_value_by_type(sedan, 500000).

📋 Casos de prueba incluidos
🔎 Listar todos los Toyota SUV con precio menor a $30,000.

📊 Mostrar vehículos Ford agrupados por tipo y año usando bagof/3.

💵 Calcular si el inventario tipo "Sedan" supera los $500,000.

🎥 Video explicativo

📺 Ver video ← https://youtu.be/TQIaY3nyOXA

👤 Integrante
Joan Peralta Bedoya

✅ Requisitos cumplidos
 Código funcional en Prolog

 Consultas de prueba con capturas

 Documentación completa

 Video explicativo

 Repositorio GitHub con README
