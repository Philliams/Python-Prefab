Design Template
========================================

It is crucial to document not only what design, architecture and decisions are made, but also why said decisions or designs were chosen.
The design document is based on the `Heilmeier catechism <https://www.darpa.mil/work-with-us/heilmeier-catechism>`_ and
aims to provide a template for what decisions, why there were made, and any relevant context or information.

Design Overview
----------------------------------------

**Design Title** : Python Prefab

**Responsible For Design** : Philliams

Context
----------------------------------------

When approaching green-field python projects, a significant portion of time is spent setting up infrastructure.
Things such as testing, documentation, CD/CI or dependency management are common activies that can be mostly handled in a 
standard way.

This design outlines the choice of technologies and repository structure for a prefabricated python project (``Python-Prefab``).

Design
----------------------------------------

There are 4 main aspects of the ``Python-Prefab`` design:

1. Containerization
2. Automation
3. CD/CI pipelines
4. Documentation



Containerization
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Relevant Links
----------------------------------------
