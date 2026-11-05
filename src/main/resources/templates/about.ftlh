<#import "layout.ftlh" as l>
<@l.page title="About" active="about">
<!--about page-->
<!doctype ftlh>
<ftlh lang="en">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <title>ASOIAF Gallery - about</title>
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
          <a class="nav-link" href="index.ftlh">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="about.ftlh">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="new-character-form.ftlh">Add a Character</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="page-header border-bottom">
        <h1> About the Website </h1>
</div>

<div class="container-lg abtsect">
    <div class="row">
        <div class="col-lg-8">
            <div class="section border-bottom">
        <h2 style="text-align:center">
            Welcome to the A Song of Ice and Fire Character Gallery
        </h2>
        <p style="text-align: center">
            This gallery showcases some characters from George R.R. Martin's A Song of Ice and Fire.
        </p>
        </div>
            <div class="section margin-top:20px">
        <h3 style="text-align:center" style="margin-top:20px">
            Design Choices and Sources
        </h3>
        <p style = "text-align:center">
            I chose a simple color scheme to reflect the themes of fire / ice and summer / winter in the series. All images were pulled from the official ASOIAF wiki.
        </p>
        </div>
        <div class="container-sm style=centered">
    <a href="index.ftlh" class="btn back-button mb-4" style="text-align:center">← Back to Gallery</a>

</div>
        </div>
        
        <div class="col-sm">
            <img src="images/abtimg.jpg" class="card-img-top" alt="...">
            <p style="text-align:center">Daenerys and her dragons...</p>
    </div>
</div>
</div>
  </@l.page>