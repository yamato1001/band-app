function buildChildHTML(child){
  const html =`<a class="CildrenMenu__List" id="${child.id}" 
              href="/items/${child.id}/select_category_index">${child.name}</a>`;
  return html;
}