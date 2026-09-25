---
name: validar
description: Valida uma ideia de negócio em português do Brasil a partir de qualquer arquivo Markdown ou de uma entrevista campo a campo. Cria o PDF validation-<IDEIA>.pdf ao lado do Markdown, sem depender de pastas, prompts ou agentes externos.
---

# Validar ideia de negócio

Conduza a validação em português do Brasil. Este arquivo contém o modelo, os métodos e os quatro prompts necessários para executar o fluxo sozinho em qualquer diretório, projeto ou máquina com Codex. Aceite um caminho absoluto ou relativo para um arquivo Markdown. Sem arquivo, entreviste o usuário e crie o Markdown no diretório de trabalho atual. Produza uma análise crítica e um PDF final com dados rastreáveis, hipóteses explícitas e recomendações proporcionais às evidências.

## Entrada e seleção

O modelo embutido tem quatro campos obrigatórios e um opcional:

```text
O Mercado: [setor e mercado de atuação]
A Empresa: [nome da empresa ou projeto]
O Problema: [quem enfrenta o problema, quando e com qual impacto]
A Ideia: [solução proposta e uso da tecnologia]

Pitch Madlibs: [opcional; pitch escrito pelo autor]
```

**Com arquivo:** use exatamente o arquivo Markdown indicado, independentemente da pasta ou do nome. Não exija `ideia/`, `MODELO.md`, `interpreters/` ou `prompts/`. Extraia os campos pelo sentido do texto, mesmo que os títulos sejam diferentes. Se faltar informação essencial para identificar empresa, problema, solução ou mercado, pergunte pelo campo ausente, um de cada vez. Não altere o arquivo de entrada sem pedido do usuário. Nunca valide um arquivo que seja apenas um modelo com lacunas.

**Sem arquivo:** pergunte **uma coisa por mensagem** e aguarde a resposta antes da próxima pergunta: (1) mercado ou setor; (2) empresa ou nome do projeto; (3) problema, público afetado, contexto e impacto; (4) solução proposta e uso da tecnologia; (5) se o usuário já tem um Pitch Madlibs, que é opcional e pode ser pulado. Se o usuário já tiver informado algum campo na conversa, aproveite-o e pergunte somente o que falta. Faça complementos pontuais se uma resposta não trouxer o dado necessário. Depois de obter os quatro campos obrigatórios, crie `<IDEIA>.md` **no diretório de trabalho atual**, preenchendo o modelo acima e incluindo o pitch apenas se fornecido. Derive `<IDEIA>` do nome da empresa ou projeto, com caracteres seguros para nome de arquivo; não sobrescreva arquivo existente sem autorização.

## Método embutido

**Pitch Madlibs.** Preencha, a partir da ideia: `[NOME DO PROJETO]`, `[O QUE É O NEGÓCIO]`, `[PÚBLICO ALVO]`, `[O PROBLEMA]` e `[A FINALIDADE]`. Use a estrutura: “O [NOME DO PROJETO] é um [O QUE É O NEGÓCIO] que ajuda [PÚBLICO ALVO] a resolver [O PROBLEMA] utilizando [A FINALIDADE] de forma única.” Se houver pitch original, compare-o com o problema e a solução descritos, aponte incoerências, redija uma versão coerente e dê nota de clareza de 0 a 10 com motivo.

**P.R.O.V.A.**

- **P — Problema:** formule a hipótese “Acreditamos que [CLIENTE] enfrenta [PROBLEMA] quando [CONTEXTO], causando [IMPACTO]”. Separe hipóteses quando houver clientes ou problemas distintos.
- **R — Research:** busque evidências e números sobre problema, clientes, mercado e alternativas. Separe fatos, estimativas e suposições.
- **O — Organização do cliente:** identifique quem sofre o problema, usa a solução, se beneficia, decide e paga.
- **V — Valor:** descreva tarefas, dores e ganhos do cliente principal, distinguindo respostas observadas de hipóteses.
- **A — Argumento baseado em evidências:** reúna o que os dados sustentam, o que ainda falta provar e a decisão recomendada.

Não troque o significado das letras por outras expansões memorizadas. A nota geral de 0 a 10 deve refletir a qualidade da oportunidade **e a força das evidências disponíveis**; explique a escala aplicada. Uma hipótese plausível sem confirmação não merece nota alta.

## Quatro prompts embutidos

Execute na ordem abaixo, usando os prompts embutidos neste arquivo. Preencha campos entre colchetes com dados da ideia e resultados anteriores; quando a resposta for incerta, explicite a hipótese de trabalho e as alternativas. Mantenha uma seção no PDF para cada etapa.

### 1-QUEM

Para a `[IDEIA]`, identifique os atores envolvidos. Para cada ator, responda: quem sofre o problema; quem usaria a solução; quem se beneficiaria; quem decidiria a compra; quem efetivamente pagaria. Mostre alternativas e hipóteses a validar. Conclua quem parece ser o cliente principal e quem parece ser o pagador, indicando o que ainda precisa de confirmação.

### 2-QUANTO

Para o `[CLIENTE]` escolhido e a `[IDEIA]`, pesquise quantos clientes desse tipo existem no mercado brasileiro. Mostre quantidade aproximada, gasto anual possível por cliente quando estimável, cálculo do mercado, fonte e ano dos números. Diferencie dado encontrado de estimativa; não invente dados. Resuma em **Quantidade de clientes**, **Mercado estimado: R$** e **Fonte principal**. Se for uma melhoria interna de uma única empresa, identifique essa compradora e não apresente o setor inteiro como mercado endereçável da iniciativa; explique quais dados internos seriam necessários para estimar investimento e retorno.

### 3-PORQUE

Para o `[CLIENTE]` e `[PROBLEMA]`, descreva três tarefas importantes que o cliente tenta realizar, três dores relacionadas e três ganhos desejados. Seja específico. Use uma tabela com as três tarefas, dores e ganhos e marque quais respostas são hipóteses que precisam ser validadas com clientes reais.

### 4-CONCLUSAO

Sintetize as etapas anteriores no modelo **C.O.F.R.E**: **Contexto** — o que estamos fazendo; **Objetivo** — o que queremos descobrir; **Fontes** — quais evidências precisamos; **Restrições** — o que a IA não deve inventar; **Entrega** — como apresentar a resposta. Feche com veredito, justificativa, riscos decisivos e próximos passos verificáveis. Também busque concorrentes de mercado e liste os principais.

## Pesquisa e qualidade da análise

Quando um prompt exigir dados externos, pesquise fontes atuais e cite URL, título, ano/data e alcance. Para pesquisa técnica, prefira documentação oficial; para números de mercado, órgãos oficiais e levantamentos com metodologia explícita. Use links que sustentem a afirmação específica. Mostre contas e premissas; não transforme número setorial em receita endereçável sem conexão demonstrada com cliente e preço. Se a pesquisa web não estiver disponível, declare a limitação e não apresente suposições como dados.

## PDF e resposta

Grave o PDF **no mesmo diretório do Markdown**, com o prefixo `validation-` e o nome-base exato do arquivo: `/caminho/MinhaIdeia.md` gera `/caminho/validation-MinhaIdeia.pdf`. No modo entrevista, `<IDEIA>.md` e `validation-<IDEIA>.pdf` ficam ambos no diretório em que o comando foi executado. Não crie uma pasta de relatórios. Se já existir um PDF para a ideia solicitada, atualize-o com a nova validação. Mantenha intermediários fora do diretório de entrega e remova-os ao concluir.

O PDF deve conter título, origem e data; resumo com veredito e nota geral; Pitch Madlibs; aplicação de P.R.O.V.A; seções `1-QUEM`, `2-QUANTO`, `3-PORQUE` e `4-CONCLUSAO`; lacunas e premissas; referências com links clicáveis. Gere texto pesquisável, acentos legíveis, paginação e tabelas sem cortes. Use uma ferramenta de PDF disponível no ambiente, renderize as páginas e confira a legibilidade, as seções, as contas e os links antes de entregar. Se faltar ferramenta de PDF, informe precisamente a dependência e forneça a análise completa na conversa.

Responda com veredito, nota geral e link para cada PDF. Para múltiplas ideias, use uma tabela curta.
