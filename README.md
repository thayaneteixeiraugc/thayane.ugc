# Portfólio UGC Creator — Thayane Teixeira

Site estático pessoal da Thayane Teixeira, UGC Creator, baseada no Rio de Janeiro.

Nichos atendidos: **tech, casa, bem estar, beleza e maternidade**, com tech como
nicho de principal objetivo.

## Como publicar

O site é um único arquivo, `index.html`, sem build e sem dependências. As únicas
fontes externas são as do Google Fonts (DM Serif Display, Cormorant Garamond,
Open Sans e Poppins).

### Opção 1: GitHub Pages (já configurado)

1. Crie um repositório com o nome `usuario.github.io` (ou qualquer outro nome).
2. Suba o `index.html` na branch `main` na raiz do repositório.
3. Em **Settings → Pages**, escolha **Deploy from a branch**, branch `main`,
   pasta `/ (root)`.
4. O site fica disponível em `https://usuario.github.io/` em cerca de um minuto.

### Opção 2: Abrir localmente

Dê dois cliques no `index.html`. Funciona direto no navegador, sem servidor.

## Identidade visual

A paleta e a tipografia seguem a identidade established da marca pessoal:

| Cor | Uso |
|---|---|
| `#694d38` | Café escuro, cor principal, títulos e menu |
| `#f3e7da` | Creme, fundo do papel |
| `#d8b08c` | Bege, detalhes e bordas suaves |
| `#a47148` | Caramelo, acentos e borders |
| `#8a5a3c` | Café médio, frase de destaque |
| `#605331` | Olive escuro, estados alternativos |
| `#60211a` | Vinho profundo, mensagens de erro |

Tipografia:

- **DM Serif Display** nos títulos
- **Cormorant Garamond** nas frases de destaque, legendas e depoimentos
- **Open Sans** no corpo do texto
- **Poppins** nas etiquetas, navegação e textos em caixa alta

### A assinatura do café ☕

O café é a assinatura da marca e aparece em:

- Selo circular no canto das fotos (capa e retrato)
- Fim da frase principal da capa
- Ao lado da assinatura "Thayane Teixeira"
- Título do card de captura do mídia kit
- Rodapé, junto do nome e do copyright

Emojis do estilo gráfico: `✨ 🤎 💫 ⭐️ ☕`

## Estrutura do arquivo

Tudo está em um único arquivo, na ordem:

1. Capa (menu fixo, nome, frase, botões, foto, três números, faixa de marcas)
2. Sobre mim (foto, texto, três promessas, assinatura)
3. Conteúdos de destaque (três vídeos verticais 9:16 com play e número)
4. Trabalhos por nicho (galeria com filtro por nicho)
5. Como eu te ajudo (seis serviços)
6. Números e depoimentos (métricas com contador, três campanhas, quatro depoimentos)
7. Bora criar juntos (formulário e atalhos de contato)
8. Rodapé (nome, redes, ano automático)

Mais o card de captura do mídia kit, que aparece sozinho depois de 7 segundos
e só aparece uma vez por visita (guardado em `sessionStorage`).

## Onde editar os dados

Todos os textos, links e listas ficam em arrays no começo do `<script>`:

| Array | O que controla |
|---|---|
| `PERFIL` | Nome, cidade, Instagram, e-mail, WhatsApp, frase |
| `MARCAS` | Faixa de marcas no fim da capa |
| `NICHOS` | Botões de filtro da galeria |
| `DESTAQUES` | Três vídeos em destaque (link, capa, número, título) |
| `TRABALHOS` | Galeria de trabalhos, com nicho de cada um |
| `SERVICOS` | Os seis serviços |
| `METRICAS` | Os quatro números do contador animado |
| `RESULTADOS` | As três campanhas |
| `DEPOIMENTOS` | As quatro falas de clientes |

### Trocar fotos e vídeos

- **Destaques:** em `DESTAQUES`, troque `link` pelo endereço do vídeo e `capa`
  pelo caminho da imagem vertical 9:16, por exemplo `"img/destaque1.jpg"`.
- **Trabalhos:** em `TRABALHOS`, preencha o campo `imagem`, por exemplo
  `"img/trabalho01.jpg"`. Sem imagem, o site mostra um degradê com a legenda do
  formato.
- **Fotos da capa e do sobre:** existem comentários no HTML indicando o ponto
  exato de troca.

### Formulários

O formulário de contato e o do mídia kit mostram a confirmação na própria tela,
sem recarregar a página. Para receber as mensagens de verdade, conecte o
`<form>` a um serviço de formulário (Formspree, Basin, Web3Forms) ou a um
backend próprio, ajustando o `action` do formulário e a chamada em
`formContato.addEventListener("submit", ...)`.

## Acessibilidade e performance

- Tags semânticas, foco visível no teclado e contraste alto.
- Todos os pares de cor passam de 4.5:1 (WCAG AA), medidos no navegador.
- `alt` em todas as imagens e legendas com o formato de cada mídia.
- Respeita `prefers-reduced-motion`: sem animações e sem contador animado.
- Sem frameworks e sem biblioteca externa de JavaScript ou CSS.
- Acompanhamento por `IntersectionObserver` para as animações de entrada.

## Licença

Uso pessoal. Todos os direitos reservados.
