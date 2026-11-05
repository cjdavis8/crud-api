<#import "layout.ftlh" as l>
  <@l.page title="Character Details - ${character.name}" active="home">
<!doctype ftlh>




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
    <div class="actions">
          <a class="button" href="/characters/${character.id?c}/edit">Edit</a>
            <form method="post" action="/plants/${character.id?c}/delete" onsubmit="return confirm('Remove this character?');">
              <button type="submit" class="danger">Delete</button>
            </form>
        </div>
<a href="/" class="btn back-button mb-4">← Back to Gallery</a>
</div>

  </@l.page>