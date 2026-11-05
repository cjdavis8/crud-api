<#import "layout.ftlh" as l>
  <@l.page title="Characters" active="home">

        <h1>Characters</h1>

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
          <h1>${character.name}</h1>
          <div class="card-body">
            <h5 class="card-title">${character.title}</h5>
                    <p class="card-text"> ${character.summary}</p>
                    <a href="/characters/${character.id}" class="btn btn-primary">Details</a>

          </div>
        </article>
      </#list>
    </div>
  </@l.page>