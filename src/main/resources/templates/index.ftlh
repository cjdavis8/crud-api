<#import "layout.ftlh" as l>
  <@l.page title="Characters" active="home">

    <h1>ASOIAF Characters</h1>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <title>ASOIAF Gallery</title>
  </head>

  <body class = "d-flex flex-column min-vh-100">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    <!--nav bar-->
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.html">ASOIAF Gallery</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.html">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="details.html">Details</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="about.html">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="new-character-form.html">Add a Character</a>
        </li>
      </ul>
      <form method="get" action="/characters" class="search">
      <input type="text" name="name" value="${name!''}" placeholder="Search by name">
      <select name="loyalty">
        <option value="">Any loyalty</option>
        <option value="JOFFREY" <#if selectedLoyalty=='JOFFREY'>selected</#if>>Joffrey</option>
        <option value="RENLY" <#if selectedLoyalty=='RENLY'>selected</#if>>Renly</option>
        <option value="STANNIS" <#if selectedLoyalty=='STANNIS'>selected</#if>>Stannis</option>
        <option value="ROBB" <#if selectedLoyalty=='ROBB'>selected</#if>>Rob</option>
        <option value="BALON" <#if selectedLoyalty=='BALON'>selected</#if>>Balon</option>
        <option value="DAENERYS" <#if selectedLoyalty=='DAENERYS'>selected</#if>>Daenerys</option>
        <option value="NONE" <#if selectedLoyalty=='NONE'>selected</#if>>None</option>
      </select>
      <button type="submit">Search</button>
      <#if name?has_content || selectedLoyalty?has_content>
        <a href="/characters" class="clear">Clear</a>
      </#if>
    </form>
    </div>
  </div>
</nav>


    <p class="count">${characters?size} character(s)</p>

    <div class="grid">
      <#list characters as character>
        <article class="card">
          <a href="/characters/${character.id?c}">
            <img src="/thumbnails/${(character.thumbnailUrl)!'character-placeholder.svg'}" alt="${character.name}" width="200"
              height="200">
          </a>
          <div class="card-body">
            <h5 class="card-title">${character.title}</h5>
                    <p class="card-text"> ${character.summary}</p>
                    <a href="/characters/${character.id}" class="btn btn-primary">Details</a>

            </#if>
          </div>
        </article>
        <#else>
          <p class="empty">No characters found.</p>
      </#list>
    </div>
  </@l.page>