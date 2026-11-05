<#import "layout.ftlh" as l>
  <@l.page title=formTitle active=(characterId??)?then('', 'new' )>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <title>ASOIAF Gallery - create a new character</title>
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
          <a class="nav-link" href="about.ftlh">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" active href="new-character-form.ftlh">Add a Character</a>
        </li>
      </ul>
    </div>
  </div>
</nav>


<div class="page-header border-bottom">
        <h1> Add a New ASOIAF Character </h1>
        </div>
        <div class="row justify-content-center">
                <div class="col-sm-6">
                    <div class="card charform mb-4">
                        <div class="card-body">
                            <h5 class="card-title mb-4">Character Form</h5>
                            <form id="characterForm">
                                <div class="mb-3">
                                    <label for="characterName" class="form-label"><strong>Character Name
                                            *</strong></label>
                                    <input type="text" id="characterName" name="name" placeholder="eg., Lem Lemoncloak" required="" class="form-control">
                                    <small class="form-text text-muted">The name of the character</small>
                                </div>

                                <div class="mb-3">
                                    <label for="category" class="form-label"><strong>Loyalty
                                            *</strong></label>
                                    <select id="category" name="category" required="" class="form-select">JOFFREY, RENLY, STANNIS, ROBB, BALON, DAENERYS, NONE
                                        <option value="">-- Select Loyalty --</option>
                                        <option value="Joffrey">Joffrey</option>
                                        <option value="Renly">Renly</option>
                                        <option value="Stannis">Stannis</option>
                                        <option value="Robb">Robb</option>
                                        <option value="Balon">Balon</option>
                                        <option value="Daenerys">Daenerys</option>
                                        <option value="None">None</option>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label for="imageUrl" class="form-label"><strong>Image URL *</strong></label>
                                    <input type="url" id="imageUrl" name="imageUrl" placeholder="https://example.com/lemoncloak.jpg" required="" class="form-control">
                                    <small class="form-text text-muted">Link to a character image (must be a valid
                                        URL)</small>
                                </div>

                                <div class="mb-3">
                                    <label for="title" class="form-label"><strong>Title
                                            *</strong></label>
                                    <textarea id="title" name="title" placeholder="Give the character a title (eg "king in the north)..." rows="3" required="" class="form-control"></textarea>
                                    <small class="form-text text-muted">A title for the character</small>
                                </div>

                                <div class="mb-3">
                                    <label for="summary" class="form-label"><strong>Summary
                                            *</strong></label>
                                    <textarea id="summary" name="summary" placeholder="Describe the character in 1-2 sentences..." rows="3" required="" class="form-control"></textarea>
                                    <small class="form-text text-muted">A brief summary of the character (100-200
                                        characters)</small>
                                </div>

                                <div class="mb-3">
                                    <label for="description" class="form-label"><strong>Description
                                            *</strong></label>
                                    <textarea id="description" name="description" placeholder="Describe the character in 1-2 paragraphs..." rows="3" required="" class="form-control"></textarea>
                                    <small class="form-text text-muted">A longer description of the character.</small>
                                </div>

                                <div class="mb-3">
                                    <label for="isKnight" class="form-label"><strong>Is (s)he a knight?
                                            *</strong></label>
                                    <select id="isKnight" name="isKnight" required="" class="form-select">
                                        <option value="No">No</option>
                                        <option value="Yes">Yes</option>
                                    </select>

                                <div class="d-grid mt-3 gap-2 d-sm-flex justify-content-sm-start">
                                    <button type="submit" class="btn btn-danger">Add Character</button>
                                    <a href="index.ftlh" class="btn btn-outline-secondary">Cancel</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
</div>

  </@l.page>