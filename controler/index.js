     // Dados dos personagens
     let personagens = [];

     // Formulário de cadastro de personagem
     const form = document.getElementById('personagemForm');
     const nomeInput = document.getElementById('nome');
     const racaSelect = document.getElementById('raca');
     const classeSelect = document.getElementById('classe');
 /*     const habilidadesSelect = document.getElementById('habilidades');
  */    const cadastrarButton = document.getElementById('cadastrarButton');
 
     cadastrarButton.addEventListener('click', function () {
       form.style.display = 'block';
       cadastrarButton.style.display = 'none';
     });
 
     form.addEventListener('submit', function (event) {
       event.preventDefault();
 
       const nome = nomeInput.value;
       const raca = racaSelect.value;
       const classe = classeSelect.value;
 /*       const habilidades = Array.from(habilidadesSelect.selectedOptions, option => option.value);
  */
       const personagem = { nome, raca, classe, /* habilidades */ };
       personagens.push(personagem);
 
       renderPersonagensList();
       form.reset();
       form.style.display = 'none';
       cadastrarButton.style.display = 'block';
     });
 
     // Renderiza a lista de personagens
     function renderPersonagensList() {
       const personagensList = document.getElementById('personagensList');
       personagensList.innerHTML = '';
 
       personagens.forEach((personagem, index) => {
         const listItem = document.createElement('li');
         listItem.className = 'list-group-item d-flex justify-content-between align-items-center';
         listItem.textContent = personagem.nome +  personagem.raca + personagem.classe ;
 
         const excluirButton = document.createElement('button');
         excluirButton.className = 'btn btn-danger btn-sm';
         excluirButton.textContent = 'Excluir';
         excluirButton.addEventListener('click', function (event) {
           event.stopPropagation();
           excluirPersonagem(index);
         });
 
         listItem.appendChild(excluirButton);
         personagensList.appendChild(listItem);
 
         listItem.addEventListener('click', function () {
           exibirFicha(index);
         });
       });
     }
 
     // Exclui um personagem
     function excluirPersonagem(index) {
       personagens.splice(index, 1);
       renderPersonagensList();
     }
 
     // Exibe a ficha do jogador
     function exibirFicha(index) {
       const personagem = personagens[index];
       const urlParams = new URLSearchParams();
       urlParams.append('nome', personagem.nome);
       urlParams.append('raca', personagem.raca);
       urlParams.append('classe', personagem.classe);
       /* personagem.habilidades.forEach((habilidade, index) => {
         urlParams.append(`habilidade${index + 1}`, habilidade);
       }) */;
 
       const queryString = urlParams.toString();
       const url = `ficha.html?${queryString}`;
       window.open(url, '_blank');
     }
 
     // Filtra os personagens pelo nome
     function filtrarPersonagens() {
       const searchInput = document.getElementById('search');
       const searchTerm = searchInput.value.toLowerCase();
 
       const filteredPersonagens = personagens.filter(personagem => personagem.nome.toLowerCase().includes(searchTerm));
 
       renderPersonagensList(filteredPersonagens);
     }
     // Renderiza a lista de personagens inicialmente
     renderPersonagensList();