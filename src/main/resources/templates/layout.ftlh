<#-- Shared page layout. Every page calls this macro, so the head and the navigation exist in ONE place. Usage in a
  page: <#import "layout.ftlh" as l>
  <@l.page title="Home" active="home"> ...page content... </@l.page> -->
  <#macro page title active="">
    <!DOCTYPE html>
    <html lang="en">

      <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/styles.css">
    <title>ASOIAF Gallery - about</title>
  </head>

  <body class = "d-flex flex-column min-vh-100">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    <!--nav bar-->
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="/">ASOIAF Gallery</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="/">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="/about">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/characters/new">Add a Character</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

    <main class="container">
        <#-- A flash message survives exactly one redirect (see RedirectAttributes in the controller). -->
          <#if message??>
            <p class="alert">${message}</p>
          </#if>
          <#nested>
      </main>

    </body>

    </html>
  </#macro>