Design Template
========================================

It is crucial to document not only what design, architecture and decisions are made, but also why said decisions or designs were chosen.
The design document is based on the `Heilmeier catechism <https://www.darpa.mil/work-with-us/heilmeier-catechism>`_ and
aims to provide a template for what decisions, why there were made, and any relevant context or information.

Design Overview
----------------------------------------

This section outlines summary information for the design document.

**Design Title** : Python Prefab

**Responsible For Design** : Philliams

**Date of the design** : 29/08/2023

Context
----------------------------------------

The context provides key background information about the design. Some information would include:

1. The problem being solved
2. Key limitations (such as compute, security, etc.)
3. Existing resources available
4. Architectural constraints (must scale, cannot use X technology, must have X% uptime, etc.)
5. Relevant development timelines
6. Etc.

Requirements and Assumptions
----------------------------------------

The requirements and assumptions provide clear specification as to the exact nature of the problem being solved:

1. How is the software being run?
2. How often is the software being run?
3. What are the SLA's for the software?
4. What are the inputs and outputs to the system?
5. What environment is the software deployed on?
6. How the software interact with other components?
7. Etc.

Design
----------------------------------------

The design will describe the technologies, architecture and implementation chosen.
This section should include various diagrams, code snippets and other media to help
describe the final decision made.


Pros and Cons
----------------------------------------

The pros and cons section will describe the advantages and disadvantages of the chosen design.
This may include information such as performance and cost, complexity, testibility, deployability,
development costs and risks

Alternatives Not Chosen
----------------------------------------

Typically several options will be considered.
This section will give a summary description of various alternatives and why they were not chosen.

Milestones
----------------------------------------

This section should describe what the intermediate and final checks and deliverables are, as well as how they would be checked:

1. What are the milestones/deliverables?
2. When are the milestones/deliverables due?
3. How are the milestones/deliverables validated?

Future Considerations
----------------------------------------

The design is chosen given a set on constraints at a given point in time.
If requirements, constraints or context change, then a different design may be more favorable.
This section describes under what conditions the design should be re-evaluated.

Relevant Links
----------------------------------------

This section contains links to relevant resources:

1. External design documents
2. Links to various libraries and references
3. Training videos
4. Blog posts
5. Etc.