# App Minha Saude Feminina - Grupo: Arthur Cervi, Luan Neves e Mateus Rosa.

# Este aplicativo tem como o objetivo de auxiliar mulheres no acompanhamento da sua saúde e bem-estar de forma prática, segura e acessível. O app reúne algumas funcionalidades importantes para o controle da saúde feminina no dia a dia, oferecendo organização, informação e apoio em um único lugar. Foi desenvolvido atráves da curricularização da extensão, com o apoio e junção dos cursos de Sistemas de Informação e Medicina.

## Visao geral
O Minha Saude Feminina e uma plataforma digital gratuita para apoiar mulheres em todas as fases da vida, integrando autocuidado, informacao confiavel e acompanhamento do ciclo menstrual. O conteudo e produzido por estudantes de Medicina, com base em referencias cientificas e diretrizes do SUS e do Ministerio da Saude, em linguagem simples, acolhedora e respeitosa.

## Objetivos do projeto
- Desenvolver competencias tecnicas com um problema real.
- Atender requisitos de um cliente institucional.
- Gerar impacto social concreto.
- Vivenciar aprendizagem baseada em projetos.
- Exercitar responsabilidade etica e sensibilidade pedagogica.

## Requisitos do produto
- Navegacao simples, intuitiva e acessivel para diferentes faixas etarias.
- Disponibilidade para Android e iOS, com desenvolvimento em Flutter.
- Linguagem clara, objetiva e adequada ao publico feminino em todas as fases da vida.
- Organizacao tematica por areas.
- Protecao e privacidade dos dados das usuarias.

## Funcionalidades principais
- Home personalizada por perfil (adolescente, adulta, gestante, tentante, climaterio/menopausa, senescencia).
- Calendario menstrual com registro de ciclo, intensidade e sintomas.
- Diario de sintomas e queixas com icones no calendario para facilitar a consulta na UBS.
- Analise do ciclo (duracao media, variacoes, historico de ciclos).
- Conteudos educativos baseados em evidencias, com busca e trilhas por fase da vida.
- Lembretes de anticoncepcional, consultas, exames preventivos e vacinas.
- Rede de apoio e contatos uteis (UBS, Disque Saude, apoio a violencia).
- Canal de duvidas anonimas com orientacoes educativas e incentivo a busca da UBS.
- Avisos fixos de seguranca: as informacoes nao substituem avaliacao medica.

## Conteudos priorizados (base clinica)
* Corrimento vaginal: sinais de normalidade e alerta.
* Colica e dor pelvica.
* Atraso menstrual.
* Sangramento fora do periodo menstrual.
* Dor ou ardor ao urinar.
* Conheca seu ciclo menstrual.
* TPM e alteracoes emocionais.
* Prevencao e rastreio do cancer de colo do utero.
* Prevencao e rastreio do cancer de mama.
* Violencia contra a mulher.
* Climaterio e menopausa.
* Autocuidado e habitos saudaveis.

Outras areas de conteudo: contracepcao, gestacao, puerperio, saude sexual e emocional, alimentacao e bem-estar.

## Principios de linguagem e cuidado
* Conteudos curtos, objetivos e acolhedores.
* Orientacoes praticas do que fazer em casa e quando procurar a UBS.
* Respeito a diversidade e ausencia de julgamento.
* Aviso permanente: "Essas informacoes nao substituem avaliacao medica. Procure sempre a UBS para confirmacao e acompanhamento.".

## Identidade visual (referencia)
* Nome: Minha Saude Feminina.
* Fontes: Gabriel Sans Condensed, Leckerli One.
* Paleta principal: #FBF4EB, #FBD9E5, #C43A4A.
* Paleta secundaria: #C56682, #E7A48C.

## Estrutura inicial do projeto

.
├─ app/
│  ├─ src/
│  │  ├─ app/               # navegacao, temas, estado global
│  │  ├─ features/
│  │  │  ├─ cycle/           # calendario, registros e analise do ciclo
│  │  │  ├─ education/       # artigos, trilhas e busca
│  │  │  ├─ reminders/       # lembretes e notificacoes
│  │  │  ├─ support/         # rede de apoio e contatos uteis
│  │  │  └─ profile/         # perfil e configuracoes
│  │  ├─ components/         # componentes reutilizaveis
│  │  ├─ services/           # persistencia, notificacoes, analytics
│  │  ├─ content/            # textos e midias curados
│  │  └─ styles/             # tokens de design e temas
│  └─ assets/                # icones, imagens e fontes
├─ platforms/
│  ├─ android/               # build Android
│  └─ ios/                   # build iOS
├─ content/
│  ├─ artigos/               # base editorial por tema
│  ├─ fases-da-vida/         # trilhas por fase
│  └─ referencias/           # fontes e diretrizes
├─ docs/
│  ├─ ux/                    # fluxos, prototipos e decisoes de design
│  ├─ privacidade/           # politicas e consentimento
│  └─ requisitos/            # escopo e criterios de aceite
└─ README.md


## Referencias institucionais e cientificas
* Protocolos de Atencao Basica: Saude das Mulheres (MS).
* Politica Nacional de Atencao Integral a Saude da Mulher (MS).
* Diretrizes do INCA para rastreamento de cancer do colo do utero.
* Diretrizes do INCA para deteccao precoce do cancer de mama.
* Materiais da SMS Brusque e cartilhas do Ministerio da Saude.

## Prototipos e inspiracoes
* Figma e prototipos listados em [Projeto Analisados medicina.docx](Projeto%20Analisados%20medicina.docx).

## Observacoes eticas e de seguranca
* O app nao substitui consulta medica ou diagnostico.
* Informacoes devem incentivar a busca pela UBS e o autocuidado informado.
* Conteudo sensivel (violencia, sexualidade, saude mental) deve seguir linguagem acolhedora e segura.
