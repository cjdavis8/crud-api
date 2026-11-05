<#import "layout.ftlh" as l>
  <@l.page title="Character Details - ${character.name}" active="home">
<!doctype ftlh>
<ftlh lang="en">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <title>ASOIAF Gallery - ${character.name}</title>
  </head>

  <body class = "d-flex flex-column min-vh-100">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    <!--nav bar-->
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.ftlh">ASOIAF Gallery</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="index.ftlh">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="details.ftlh">Details</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="about.ftlh">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="new-character-form.ftlh">Add a Character</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container-md py-3 ">
    <div class="row">
        <div class="col-sm-4">    
        <img class="detailsimg" src="/thumbnails/${(character.thumbnailUrl)!'stock.jpg'}" alt="${character.name}" width="400" height="400">
            <div class="card details-card mb-3 mt-3">
                <div class = "card-header">
                    <h4>${character.name}</h4>
                </div>
            <div class="card-body">
                <h3 style="font-weight:700; text-align:left">
                    ${character.title}
                </h3>
                <p>
                    ${character.summary}
                </p>
                <p>
                    <b>Loyalty: </b> 
                    <span class="badge bg-dark">
                        ${character.loyalty}
                    </span>
                </p>
            </div>
            </div>
        </div>
        
        <div class="col-sm py-4 mt-55">
            <h3 style="text-align:left">
                About the Character
            </h3>
            <p> ${character.description}</p>
    </div>
</div>
<a href="index.ftlh" class="btn back-button mb-4">← Back to Gallery</a>
</div>

  </@l.page>