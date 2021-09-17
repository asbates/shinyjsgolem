# shinyjsgolem
Reprex for an issue with shinyjs in golem

I have an issue with trying to extend `shinyjs` in a `golem` application.
I've managed to make things work under certain conditions but even when it works, there's some errors/warnings in the JS console.


When including a `shinyjs` extension function as text, it works with a warning.
When including an extension as an external JS file, it doesn't work per the `shinyjs` docs.
However, if I wrap the function, in the external JS file, in `$( document ).ready(function() {...});` it works, again with an error.

I think the issue is related to the order in which resources are loaded.
The JS file tries to load before `shinyjs` and so JS throws an error about `shinyjs` not being defined.
Then `shinyjs` loads, followed by the JS file, and then it works.
At least, that is what I think is going on.
