/****** Object:  Table [dbo].[faqtb001_dialogo]    Script Date: 19/01/2020 23:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[faqtb001_dialogo](
	[nu_dialogo] [int] IDENTITY(1,1) NOT NULL,
	[no_dialogo] [varchar](200) NOT NULL,
 CONSTRAINT [PK_faqtb001_dialogo] PRIMARY KEY CLUSTERED 
(
	[nu_dialogo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[faqtb002_conversa]    Script Date: 19/01/2020 23:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[faqtb002_conversa](
	[nu_conversa] [int] IDENTITY(1,1) NOT NULL,
	[nu_dialogo] [int] NOT NULL,
	[de_conversa] [varchar](4000) NOT NULL,
	[ic_tipo_conversa] [char](1) NOT NULL,
	[nu_variavel] [int] NULL,
 CONSTRAINT [PK_faqtb002_conversa] PRIMARY KEY CLUSTERED 
(
	[nu_conversa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[faqtb003_regra]    Script Date: 19/01/2020 23:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[faqtb003_regra](
	[nu_conversa_anterior] [int] NOT NULL,
	[nu_conversa_posterior] [int] NOT NULL,
	[de_regra] [varchar](4000) NOT NULL,
 CONSTRAINT [PK_faqtb003_regra] PRIMARY KEY CLUSTERED 
(
	[nu_conversa_anterior] ASC,
	[nu_conversa_posterior] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[faqtb004_sessao]    Script Date: 19/01/2020 23:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[faqtb004_sessao](
	[nu_sessao] [int] IDENTITY(1,1) NOT NULL,
	[dh_sessao] [datetime] NOT NULL,
	[no_usuario] [varchar](200) NOT NULL,
	[nu_dialogo] [int] NOT NULL,
 CONSTRAINT [PK_faqtb004_sessao] PRIMARY KEY CLUSTERED 
(
	[nu_sessao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[faqtb005_resposta]    Script Date: 19/01/2020 23:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[faqtb005_resposta](
	[nu_reposta] [int] IDENTITY(1,1) NOT NULL,
	[nu_sessao] [int] NOT NULL,
	[nu_conversa] [int] NOT NULL,
	[dh_resposta] [datetime] NOT NULL,
	[de_reposta] [varchar](200) NOT NULL,
	[nu_variavel] [int] NOT NULL,
 CONSTRAINT [PK_faqtb005_resposta] PRIMARY KEY CLUSTERED 
(
	[nu_reposta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[faqtb006_envio]    Script Date: 19/01/2020 23:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[faqtb006_envio](
	[nu_envio] [int] IDENTITY(1,1) NOT NULL,
	[nu_sessao] [int] NOT NULL,
	[nu_conversa] [int] NOT NULL,
	[dh_envio] [datetime] NOT NULL,
 CONSTRAINT [PK_faqtb006_envio] PRIMARY KEY CLUSTERED 
(
	[nu_envio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[faqtb007_tipo_conversa]    Script Date: 19/01/2020 23:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[faqtb007_tipo_conversa](
	[ic_tipo_conversa] [char](1) NOT NULL,
	[no_tipo_conversa] [varchar](200) NOT NULL,
 CONSTRAINT [PK_faqtb007_tipo_conversa] PRIMARY KEY CLUSTERED 
(
	[ic_tipo_conversa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[faqtb008_cartao]    Script Date: 19/01/2020 23:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[faqtb008_cartao](
	[nu_cartao] [int] IDENTITY(1,1) NOT NULL,
	[nu_conversa] [int] NOT NULL,
	[vr_cartao] [varchar](50) NOT NULL,
	[de_cartao] [varchar](200) NOT NULL,
 CONSTRAINT [PK_faqtb008_cartao] PRIMARY KEY CLUSTERED 
(
	[nu_cartao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[faqtb009_variavel]    Script Date: 19/01/2020 23:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[faqtb009_variavel](
	[nu_variavel] [int] IDENTITY(1,1) NOT NULL,
	[no_variavel] [varchar](50) NOT NULL,
	[ic_tipo_variavel] [char](1) NOT NULL,
	[nu_dialogo] [int] NOT NULL,
 CONSTRAINT [PK_faqtb009_variavel] PRIMARY KEY CLUSTERED 
(
	[nu_variavel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[faqtb001_dialogo] ON 

INSERT [dbo].[faqtb001_dialogo] ([nu_dialogo], [no_dialogo]) VALUES (1, N'Dialogo SUSEP')
SET IDENTITY_INSERT [dbo].[faqtb001_dialogo] OFF
SET IDENTITY_INSERT [dbo].[faqtb002_conversa] ON 

INSERT [dbo].[faqtb002_conversa] ([nu_conversa], [nu_dialogo], [de_conversa], [ic_tipo_conversa], [nu_variavel]) VALUES (1, 1, N'INICIO', N'I', NULL)
INSERT [dbo].[faqtb002_conversa] ([nu_conversa], [nu_dialogo], [de_conversa], [ic_tipo_conversa], [nu_variavel]) VALUES (2, 1, N'Olá, seja bem-vindo! Tire aequi suas dúvidas.', N'A', NULL)
INSERT [dbo].[faqtb002_conversa] ([nu_conversa], [nu_dialogo], [de_conversa], [ic_tipo_conversa], [nu_variavel]) VALUES (3, 1, N'Sobre o que você deseja saber?', N'C', 1)
INSERT [dbo].[faqtb002_conversa] ([nu_conversa], [nu_dialogo], [de_conversa], [ic_tipo_conversa], [nu_variavel]) VALUES (5, 1, N'FIM', N'F', NULL)
INSERT [dbo].[faqtb002_conversa] ([nu_conversa], [nu_dialogo], [de_conversa], [ic_tipo_conversa], [nu_variavel]) VALUES (6, 1, N'Qual sua dúvida sobre Seguros?', N'C', 1)
INSERT [dbo].[faqtb002_conversa] ([nu_conversa], [nu_dialogo], [de_conversa], [ic_tipo_conversa], [nu_variavel]) VALUES (8, 1, N'Qual sua dúvida sobre Previdência?', N'C', 1)
INSERT [dbo].[faqtb002_conversa] ([nu_conversa], [nu_dialogo], [de_conversa], [ic_tipo_conversa], [nu_variavel]) VALUES (11, 1, N'VGBL (Vida Gerador de Benefícios Livres) e PGBL (Plano Gerador de Benefícios Livres) são planos por sobrevivência (de seguro de pessoas e de previdência complementar aberta, respectivamente) que, após um período de acumulação de recursos (período de diferimento), proporcionam aos investidores (segurados e participantes) uma renda mensal - que poderá ser vitalícia ou por período determinado - ou um pagamento único. O primeiro (VGBL) é classificado como seguro de pessoa, enquanto o segundo (PGBL) é um plano de previdência complementar.', N'A', NULL)
INSERT [dbo].[faqtb002_conversa] ([nu_conversa], [nu_dialogo], [de_conversa], [ic_tipo_conversa], [nu_variavel]) VALUES (13, 1, N'Qual sua dúvida sobre CAPITALIZAÇÃO?', N'C', 1)
INSERT [dbo].[faqtb002_conversa] ([nu_conversa], [nu_dialogo], [de_conversa], [ic_tipo_conversa], [nu_variavel]) VALUES (14, 1, N'A principal diferença entre os dois reside no tratamento tributário dispensado a um e outro. Em ambos os casos, o imposto de renda incide apenas no momento do resgate ou recebimento da renda. Entretanto, enquanto no VGBL o imposto de renda incide apenas sobre os rendimentos, no PGBL o imposto incide sobre o valor total a ser resgatado ou recebido sob a forma de renda.', N'A', NULL)
INSERT [dbo].[faqtb002_conversa] ([nu_conversa], [nu_dialogo], [de_conversa], [ic_tipo_conversa], [nu_variavel]) VALUES (15, 1, N'No caso do PGBL, os participantes que utilizam o modelo completo de declaração de ajuste anual do I.R.P.F podem deduzir as contribuições do respectivo exercício, no limite máximo de 12% de sua renda bruta anual. Os prêmios/contribuições pagos a planos VGBL não podem ser deduzidos na declaração de ajuste anual do I.R.P.F e, portanto, este tipo de plano seria mais adequado aos consumidores que utilizam o modelo simplificado de declaração de ajuste anual do I.R.P.F ou aos que já ultrapassaram o limite de 12% da renda bruta anual para efeito de dedução dos prêmios e ainda desejam contratar um plano de acumulação para complementação de renda.', N'A', NULL)
INSERT [dbo].[faqtb002_conversa] ([nu_conversa], [nu_dialogo], [de_conversa], [ic_tipo_conversa], [nu_variavel]) VALUES (16, 1, N'Em casos de dúvidas sobre questões tributárias, orientamos consultar a Secretaria da Receita Federal do Brasil (www.receita.fazenda.gov.br).', N'A', NULL)
INSERT [dbo].[faqtb002_conversa] ([nu_conversa], [nu_dialogo], [de_conversa], [ic_tipo_conversa], [nu_variavel]) VALUES (18, 1, N'Qual sua dúvida sobre Seguros?', N'C', 1)
INSERT [dbo].[faqtb002_conversa] ([nu_conversa], [nu_dialogo], [de_conversa], [ic_tipo_conversa], [nu_variavel]) VALUES (19, 1, N'Qual sua dúvida sobre Seguros de Pessoas?', N'C', 1)
INSERT [dbo].[faqtb002_conversa] ([nu_conversa], [nu_dialogo], [de_conversa], [ic_tipo_conversa], [nu_variavel]) VALUES (20, 1, N'Qual sua dúvida sobre Seguros de Automóvel?', N'C', 1)
INSERT [dbo].[faqtb002_conversa] ([nu_conversa], [nu_dialogo], [de_conversa], [ic_tipo_conversa], [nu_variavel]) VALUES (21, 1, N'Qual sua dúvida sobre Seguros Residencial?', N'C', 1)
INSERT [dbo].[faqtb002_conversa] ([nu_conversa], [nu_dialogo], [de_conversa], [ic_tipo_conversa], [nu_variavel]) VALUES (22, 1, N'Qual sua dúvida sobre Seguros DPVAT?', N'C', 1)
INSERT [dbo].[faqtb002_conversa] ([nu_conversa], [nu_dialogo], [de_conversa], [ic_tipo_conversa], [nu_variavel]) VALUES (23, 1, N'Podem. Mas, como qualquer alteração contratual, dependerá de comum acordo entre as partes (segurado e seguradora). Nos seguros de pessoas, contratados sob a forma coletiva, as alterações dependem da anuência expressa de 3/4 do grupo interessado.', N'A', NULL)
INSERT [dbo].[faqtb002_conversa] ([nu_conversa], [nu_dialogo], [de_conversa], [ic_tipo_conversa], [nu_variavel]) VALUES (24, 1, N'Trata-se da ocorrência de um fato que provoca a perda do direito do segurado à indenização, ainda que, a princípio, o sinistro seja oriundo de um risco coberto, ficando, então, a seguradora isenta de qualquer obrigação decorrente do contrato.
Ocorre a perda de direito se:
        - o sinistro ocorrer por culpa grave ou dolo do segurado ou beneficiário do seguro;
        - a reclamação de indenização por sinistro for fraudulenta ou de má-fé;
        - o segurado, corretor, beneficiários ou ainda seus representantes e prepostos fizerem declarações falsas ou, por qualquer meio, tentarem obter benefícios ilícitos do seguro;
        - o segurado agravar intencionalmente o risco.
Além disso, se o segurado, seu representante, ou seu corretor de seguros fizer declarações inexatas ou omitir circunstâncias que possam influir na aceitação da proposta ou no valor do prêmio, ficará prejudicado o direito à indenização, além de estar o segurado obrigado ao pagamento do prêmio vencido.', N'A', NULL)
INSERT [dbo].[faqtb002_conversa] ([nu_conversa], [nu_dialogo], [de_conversa], [ic_tipo_conversa], [nu_variavel]) VALUES (25, 1, N'É o valor que o segurado paga à seguradora pelo seguro para transferir a ela o risco previsto nas Condições Contratuais. Pagar o prêmio é uma das principais obrigações do segurado.', N'A', NULL)
INSERT [dbo].[faqtb002_conversa] ([nu_conversa], [nu_dialogo], [de_conversa], [ic_tipo_conversa], [nu_variavel]) VALUES (27, 1, N'O não pagamento do prêmio nas datas previstas poderá acarretar a suspensão ou até mesmo o cancelamento do seguro, prejudicando o direito à indenização, caso o sinistro ocorra após a data de suspensão ou cancelamento. As condições gerais, na cláusula “pagamento de prêmio”, deverão informar em que hipóteses ocorrerão a suspensão e/ou o cancelamento do contrato em razão da falta de pagamento de prêmio.', N'A', NULL)
INSERT [dbo].[faqtb002_conversa] ([nu_conversa], [nu_dialogo], [de_conversa], [ic_tipo_conversa], [nu_variavel]) VALUES (28, 1, N'Sim. A seguradora terá o prazo de 15 dias para manifestar-se sobre a proposta (exceto seguro de transportes e rurais), contados a partir da data de seu recebimento, seja para seguros novos ou renovações, bem como para alterações que impliquem modificação do risco (endosso). Caso a seguradora não aceite a proposta, esta deverá obrigatoriamente comunicar sua recusa formalmente ao proponente, ao seu representante legal, ou ao seu corretor, apresentando a devida justificativa. Em caso de ausência de manifestação por escrito no prazo de 15 dias, a proposta de seguro é automaticamente considerada aceita pela seguradora.

Por isso, quando for contratar ou renovar o seguro, é fundamental fazê-lo com antecedência e observar esse prazo, para minimizar o risco de ficar sem cobertura.

Após a aceitação da proposta, a seguradora tem até 15 dias para emitir a apólice, certificado ou endosso.', N'A', NULL)
INSERT [dbo].[faqtb002_conversa] ([nu_conversa], [nu_dialogo], [de_conversa], [ic_tipo_conversa], [nu_variavel]) VALUES (29, 1, N'A liquidação dos sinistros deverá ser feita num prazo não superior a 30 dias, contados a partir da entrega de todos os documentos básicos apresentados pelo segurado ou beneficiário(s).
A contagem do prazo poderá ser suspensa quando, no caso de dúvida fundada e justificável, forem solicitados novos documentos, voltando a correr a partir do dia útil subseqüente àquele em que forem completamente atendidas as exigências pelo segurado ou beneficiário.
É essencial que o segurado ou beneficiário solicite à sociedade seguradora o devido protocolo que identifique a data do recebimento do aviso de sinistro e respectivos documentos.', N'A', NULL)
SET IDENTITY_INSERT [dbo].[faqtb002_conversa] OFF
INSERT [dbo].[faqtb003_regra] ([nu_conversa_anterior], [nu_conversa_posterior], [de_regra]) VALUES (1, 2, N'true')
INSERT [dbo].[faqtb003_regra] ([nu_conversa_anterior], [nu_conversa_posterior], [de_regra]) VALUES (2, 3, N'true')
INSERT [dbo].[faqtb003_regra] ([nu_conversa_anterior], [nu_conversa_posterior], [de_regra]) VALUES (3, 6, N'{{RESPOSTA}}==1')
INSERT [dbo].[faqtb003_regra] ([nu_conversa_anterior], [nu_conversa_posterior], [de_regra]) VALUES (3, 8, N'{{RESPOSTA}}==2')
INSERT [dbo].[faqtb003_regra] ([nu_conversa_anterior], [nu_conversa_posterior], [de_regra]) VALUES (3, 11, N'{{RESPOSTA}}==3')
INSERT [dbo].[faqtb003_regra] ([nu_conversa_anterior], [nu_conversa_posterior], [de_regra]) VALUES (3, 13, N'{{RESPOSTA}}==4')
INSERT [dbo].[faqtb003_regra] ([nu_conversa_anterior], [nu_conversa_posterior], [de_regra]) VALUES (6, 18, N'{{RESPOSTA}}==1')
INSERT [dbo].[faqtb003_regra] ([nu_conversa_anterior], [nu_conversa_posterior], [de_regra]) VALUES (6, 19, N'{{RESPOSTA}}==3')
INSERT [dbo].[faqtb003_regra] ([nu_conversa_anterior], [nu_conversa_posterior], [de_regra]) VALUES (6, 20, N'{{RESPOSTA}}==2')
INSERT [dbo].[faqtb003_regra] ([nu_conversa_anterior], [nu_conversa_posterior], [de_regra]) VALUES (6, 21, N'{{RESPOSTA}}==4')
INSERT [dbo].[faqtb003_regra] ([nu_conversa_anterior], [nu_conversa_posterior], [de_regra]) VALUES (6, 22, N'{{RESPOSTA}}==5')
INSERT [dbo].[faqtb003_regra] ([nu_conversa_anterior], [nu_conversa_posterior], [de_regra]) VALUES (11, 14, N'true')
INSERT [dbo].[faqtb003_regra] ([nu_conversa_anterior], [nu_conversa_posterior], [de_regra]) VALUES (14, 15, N'true')
INSERT [dbo].[faqtb003_regra] ([nu_conversa_anterior], [nu_conversa_posterior], [de_regra]) VALUES (15, 16, N'true')
INSERT [dbo].[faqtb003_regra] ([nu_conversa_anterior], [nu_conversa_posterior], [de_regra]) VALUES (16, 3, N'true')
INSERT [dbo].[faqtb003_regra] ([nu_conversa_anterior], [nu_conversa_posterior], [de_regra]) VALUES (18, 23, N'{{RESPOSTA}}==1')
INSERT [dbo].[faqtb003_regra] ([nu_conversa_anterior], [nu_conversa_posterior], [de_regra]) VALUES (18, 24, N'{{RESPOSTA}}==2')
INSERT [dbo].[faqtb003_regra] ([nu_conversa_anterior], [nu_conversa_posterior], [de_regra]) VALUES (18, 25, N'{{RESPOSTA}}==3')
INSERT [dbo].[faqtb003_regra] ([nu_conversa_anterior], [nu_conversa_posterior], [de_regra]) VALUES (18, 27, N'{{RESPOSTA}}==4')
INSERT [dbo].[faqtb003_regra] ([nu_conversa_anterior], [nu_conversa_posterior], [de_regra]) VALUES (18, 28, N'{{RESPOSTA}}==5')
INSERT [dbo].[faqtb003_regra] ([nu_conversa_anterior], [nu_conversa_posterior], [de_regra]) VALUES (18, 29, N'{{RESPOSTA}}==6')
INSERT [dbo].[faqtb003_regra] ([nu_conversa_anterior], [nu_conversa_posterior], [de_regra]) VALUES (23, 3, N'true')
INSERT [dbo].[faqtb003_regra] ([nu_conversa_anterior], [nu_conversa_posterior], [de_regra]) VALUES (24, 3, N'true')
INSERT [dbo].[faqtb003_regra] ([nu_conversa_anterior], [nu_conversa_posterior], [de_regra]) VALUES (25, 3, N'true')
INSERT [dbo].[faqtb003_regra] ([nu_conversa_anterior], [nu_conversa_posterior], [de_regra]) VALUES (27, 3, N'true')
INSERT [dbo].[faqtb003_regra] ([nu_conversa_anterior], [nu_conversa_posterior], [de_regra]) VALUES (28, 3, N'true')
INSERT [dbo].[faqtb003_regra] ([nu_conversa_anterior], [nu_conversa_posterior], [de_regra]) VALUES (29, 3, N'true')
SET IDENTITY_INSERT [dbo].[faqtb004_sessao] ON 

INSERT [dbo].[faqtb004_sessao] ([nu_sessao], [dh_sessao], [no_usuario], [nu_dialogo]) VALUES (1, CAST(N'2019-09-10T10:05:36.957' AS DateTime), N'Ivan', 1)
INSERT [dbo].[faqtb004_sessao] ([nu_sessao], [dh_sessao], [no_usuario], [nu_dialogo]) VALUES (2, CAST(N'2019-09-10T10:08:33.267' AS DateTime), N'Ivan', 1)
INSERT [dbo].[faqtb004_sessao] ([nu_sessao], [dh_sessao], [no_usuario], [nu_dialogo]) VALUES (3, CAST(N'2019-09-10T10:09:24.860' AS DateTime), N'Ivan', 1)
INSERT [dbo].[faqtb004_sessao] ([nu_sessao], [dh_sessao], [no_usuario], [nu_dialogo]) VALUES (4, CAST(N'2019-09-10T10:20:34.883' AS DateTime), N'Ivan', 1)
INSERT [dbo].[faqtb004_sessao] ([nu_sessao], [dh_sessao], [no_usuario], [nu_dialogo]) VALUES (5, CAST(N'2019-09-10T10:21:33.723' AS DateTime), N'Ivan', 1)
INSERT [dbo].[faqtb004_sessao] ([nu_sessao], [dh_sessao], [no_usuario], [nu_dialogo]) VALUES (6, CAST(N'2019-09-10T10:34:40.743' AS DateTime), N'Ivan', 1)
INSERT [dbo].[faqtb004_sessao] ([nu_sessao], [dh_sessao], [no_usuario], [nu_dialogo]) VALUES (8, CAST(N'2020-01-19T20:48:50.853' AS DateTime), N'Ivan', 1)
INSERT [dbo].[faqtb004_sessao] ([nu_sessao], [dh_sessao], [no_usuario], [nu_dialogo]) VALUES (9, CAST(N'2020-01-19T20:59:46.620' AS DateTime), N'Ivan', 1)
INSERT [dbo].[faqtb004_sessao] ([nu_sessao], [dh_sessao], [no_usuario], [nu_dialogo]) VALUES (10, CAST(N'2020-01-19T21:14:40.363' AS DateTime), N'Ivan', 1)
INSERT [dbo].[faqtb004_sessao] ([nu_sessao], [dh_sessao], [no_usuario], [nu_dialogo]) VALUES (11, CAST(N'2020-01-19T21:20:34.623' AS DateTime), N'Ivan', 1)
INSERT [dbo].[faqtb004_sessao] ([nu_sessao], [dh_sessao], [no_usuario], [nu_dialogo]) VALUES (12, CAST(N'2020-01-19T21:43:34.020' AS DateTime), N'Ivan', 1)
INSERT [dbo].[faqtb004_sessao] ([nu_sessao], [dh_sessao], [no_usuario], [nu_dialogo]) VALUES (13, CAST(N'2020-01-19T22:04:33.223' AS DateTime), N'Ivan', 1)
INSERT [dbo].[faqtb004_sessao] ([nu_sessao], [dh_sessao], [no_usuario], [nu_dialogo]) VALUES (14, CAST(N'2020-01-19T22:14:58.043' AS DateTime), N'Ivan', 1)
INSERT [dbo].[faqtb004_sessao] ([nu_sessao], [dh_sessao], [no_usuario], [nu_dialogo]) VALUES (15, CAST(N'2020-01-19T22:30:27.727' AS DateTime), N'Ivan', 1)
INSERT [dbo].[faqtb004_sessao] ([nu_sessao], [dh_sessao], [no_usuario], [nu_dialogo]) VALUES (16, CAST(N'2020-01-19T22:36:20.333' AS DateTime), N'Ivan', 1)
INSERT [dbo].[faqtb004_sessao] ([nu_sessao], [dh_sessao], [no_usuario], [nu_dialogo]) VALUES (17, CAST(N'2020-01-19T22:37:02.247' AS DateTime), N'Ivan', 1)
INSERT [dbo].[faqtb004_sessao] ([nu_sessao], [dh_sessao], [no_usuario], [nu_dialogo]) VALUES (18, CAST(N'2020-01-19T22:38:53.563' AS DateTime), N'Ivan', 1)
INSERT [dbo].[faqtb004_sessao] ([nu_sessao], [dh_sessao], [no_usuario], [nu_dialogo]) VALUES (19, CAST(N'2020-01-19T22:53:37.253' AS DateTime), N'Ivan', 1)
INSERT [dbo].[faqtb004_sessao] ([nu_sessao], [dh_sessao], [no_usuario], [nu_dialogo]) VALUES (20, CAST(N'2020-01-19T22:53:58.390' AS DateTime), N'Ivan', 1)
INSERT [dbo].[faqtb004_sessao] ([nu_sessao], [dh_sessao], [no_usuario], [nu_dialogo]) VALUES (21, CAST(N'2020-01-19T22:54:57.030' AS DateTime), N'Ivan', 1)
INSERT [dbo].[faqtb004_sessao] ([nu_sessao], [dh_sessao], [no_usuario], [nu_dialogo]) VALUES (22, CAST(N'2020-01-19T22:57:16.143' AS DateTime), N'Ivan', 1)
INSERT [dbo].[faqtb004_sessao] ([nu_sessao], [dh_sessao], [no_usuario], [nu_dialogo]) VALUES (23, CAST(N'2020-01-19T23:00:48.840' AS DateTime), N'Ivan', 1)
INSERT [dbo].[faqtb004_sessao] ([nu_sessao], [dh_sessao], [no_usuario], [nu_dialogo]) VALUES (24, CAST(N'2020-01-19T23:02:22.180' AS DateTime), N'Ivan', 1)
INSERT [dbo].[faqtb004_sessao] ([nu_sessao], [dh_sessao], [no_usuario], [nu_dialogo]) VALUES (25, CAST(N'2020-01-19T23:05:30.500' AS DateTime), N'Ivan', 1)
INSERT [dbo].[faqtb004_sessao] ([nu_sessao], [dh_sessao], [no_usuario], [nu_dialogo]) VALUES (26, CAST(N'2020-01-19T23:07:07.030' AS DateTime), N'Ivan', 1)
INSERT [dbo].[faqtb004_sessao] ([nu_sessao], [dh_sessao], [no_usuario], [nu_dialogo]) VALUES (27, CAST(N'2020-01-19T23:08:27.343' AS DateTime), N'Ivan', 1)
INSERT [dbo].[faqtb004_sessao] ([nu_sessao], [dh_sessao], [no_usuario], [nu_dialogo]) VALUES (28, CAST(N'2020-01-19T23:09:12.063' AS DateTime), N'Ivan', 1)
SET IDENTITY_INSERT [dbo].[faqtb004_sessao] OFF
SET IDENTITY_INSERT [dbo].[faqtb005_resposta] ON 

INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (2, 13, 3, CAST(N'2020-01-19T22:07:43.923' AS DateTime), N'1', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (3, 14, 3, CAST(N'2020-01-19T22:25:02.010' AS DateTime), N'1', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (4, 14, 3, CAST(N'2020-01-19T22:26:07.423' AS DateTime), N'1', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (5, 14, 3, CAST(N'2020-01-19T22:27:51.267' AS DateTime), N'1', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (6, 14, 3, CAST(N'2020-01-19T22:28:42.740' AS DateTime), N'1', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (7, 15, 3, CAST(N'2020-01-19T22:30:34.167' AS DateTime), N'2', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (8, 16, 3, CAST(N'2020-01-19T22:36:37.930' AS DateTime), N'4', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (9, 17, 3, CAST(N'2020-01-19T22:37:08.427' AS DateTime), N'3', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (10, 18, 3, CAST(N'2020-01-19T22:39:04.873' AS DateTime), N'3', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (11, 19, 3, CAST(N'2020-01-19T22:53:48.360' AS DateTime), N'1', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (12, 20, 3, CAST(N'2020-01-19T22:54:04.180' AS DateTime), N'1', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (13, 21, 3, CAST(N'2020-01-19T22:55:08.897' AS DateTime), N'3', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (14, 21, 3, CAST(N'2020-01-19T22:55:15.057' AS DateTime), N'1', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (15, 21, 18, CAST(N'2020-01-19T22:55:20.977' AS DateTime), N'1', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (16, 21, 3, CAST(N'2020-01-19T22:55:26.347' AS DateTime), N'1', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (17, 21, 18, CAST(N'2020-01-19T22:55:40.027' AS DateTime), N'1', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (18, 21, 3, CAST(N'2020-01-19T22:56:31.293' AS DateTime), N'1', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (19, 22, 3, CAST(N'2020-01-19T22:57:23.217' AS DateTime), N'1', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (20, 22, 18, CAST(N'2020-01-19T22:57:29.543' AS DateTime), N'1', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (21, 22, 3, CAST(N'2020-01-19T22:58:13.230' AS DateTime), N'1', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (22, 22, 18, CAST(N'2020-01-19T22:58:31.947' AS DateTime), N'1', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (23, 23, 3, CAST(N'2020-01-19T23:00:52.437' AS DateTime), N'1', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (24, 23, 18, CAST(N'2020-01-19T23:01:03.737' AS DateTime), N'1', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (25, 24, 3, CAST(N'2020-01-19T23:02:48.620' AS DateTime), N'1', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (26, 25, 3, CAST(N'2020-01-19T23:05:43.337' AS DateTime), N'1', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (27, 28, 3, CAST(N'2020-01-19T23:09:23.260' AS DateTime), N'1', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (28, 28, 6, CAST(N'2020-01-19T23:09:30.160' AS DateTime), N'1', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (29, 28, 18, CAST(N'2020-01-19T23:09:37.363' AS DateTime), N'1', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (30, 28, 3, CAST(N'2020-01-19T23:09:44.953' AS DateTime), N'1', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (31, 28, 6, CAST(N'2020-01-19T23:09:53.817' AS DateTime), N'2', 1)
INSERT [dbo].[faqtb005_resposta] ([nu_reposta], [nu_sessao], [nu_conversa], [dh_resposta], [de_reposta], [nu_variavel]) VALUES (32, 28, 20, CAST(N'2020-01-19T23:09:57.537' AS DateTime), N'2', 1)
SET IDENTITY_INSERT [dbo].[faqtb005_resposta] OFF
SET IDENTITY_INSERT [dbo].[faqtb006_envio] ON 

INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (1, 1, 1, CAST(N'2019-09-10T10:05:41.767' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (2, 2, 1, CAST(N'2019-09-10T10:08:33.907' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (3, 3, 1, CAST(N'2019-09-10T10:09:25.523' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (4, 4, 1, CAST(N'2019-09-10T10:20:35.490' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (5, 4, 2, CAST(N'2019-09-10T10:20:35.517' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (6, 4, 3, CAST(N'2019-09-10T10:20:35.517' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (7, 5, 1, CAST(N'2019-09-10T10:21:34.323' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (8, 5, 2, CAST(N'2019-09-10T10:21:34.353' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (9, 5, 3, CAST(N'2019-09-10T10:21:34.353' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (10, 6, 1, CAST(N'2019-09-10T10:34:41.403' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (11, 6, 2, CAST(N'2019-09-10T10:34:41.430' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (12, 6, 3, CAST(N'2019-09-10T10:34:41.430' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (13, 8, 1, CAST(N'2020-01-19T20:48:51.450' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (14, 8, 2, CAST(N'2020-01-19T20:48:56.787' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (15, 8, 3, CAST(N'2020-01-19T20:48:56.787' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (16, 9, 1, CAST(N'2020-01-19T20:59:47.340' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (17, 9, 2, CAST(N'2020-01-19T20:59:47.380' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (18, 9, 3, CAST(N'2020-01-19T20:59:47.387' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (19, 10, 1, CAST(N'2020-01-19T21:14:41.007' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (20, 10, 2, CAST(N'2020-01-19T21:14:41.047' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (21, 10, 3, CAST(N'2020-01-19T21:14:41.057' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (22, 11, 1, CAST(N'2020-01-19T21:20:34.727' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (23, 11, 2, CAST(N'2020-01-19T21:20:34.770' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (24, 11, 3, CAST(N'2020-01-19T21:20:34.780' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (25, 10, 3, CAST(N'2020-01-19T21:37:46.623' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (26, 10, 5, CAST(N'2020-01-19T21:37:46.660' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (27, 12, 1, CAST(N'2020-01-19T21:43:34.053' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (28, 12, 2, CAST(N'2020-01-19T21:43:34.060' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (29, 12, 3, CAST(N'2020-01-19T21:43:34.070' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (30, 12, 3, CAST(N'2020-01-19T21:43:41.873' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (31, 12, 13, CAST(N'2020-01-19T21:43:41.880' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (32, 13, 1, CAST(N'2020-01-19T22:04:33.270' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (33, 13, 2, CAST(N'2020-01-19T22:04:33.317' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (34, 13, 3, CAST(N'2020-01-19T22:04:33.327' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (35, 13, 3, CAST(N'2020-01-19T22:07:43.950' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (36, 13, 13, CAST(N'2020-01-19T22:07:43.997' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (37, 14, 1, CAST(N'2020-01-19T22:14:58.683' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (38, 14, 2, CAST(N'2020-01-19T22:15:01.730' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (39, 14, 3, CAST(N'2020-01-19T22:15:01.773' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (40, 14, 3, CAST(N'2020-01-19T22:28:42.873' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (41, 14, 6, CAST(N'2020-01-19T22:29:06.240' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (42, 15, 1, CAST(N'2020-01-19T22:30:27.757' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (43, 15, 2, CAST(N'2020-01-19T22:30:27.803' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (44, 15, 3, CAST(N'2020-01-19T22:30:27.837' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (45, 15, 3, CAST(N'2020-01-19T22:30:34.173' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (46, 15, 8, CAST(N'2020-01-19T22:30:34.317' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (47, 16, 1, CAST(N'2020-01-19T22:36:20.357' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (48, 16, 2, CAST(N'2020-01-19T22:36:20.397' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (49, 16, 3, CAST(N'2020-01-19T22:36:20.437' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (50, 16, 3, CAST(N'2020-01-19T22:36:37.940' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (51, 16, 13, CAST(N'2020-01-19T22:36:38.120' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (52, 17, 1, CAST(N'2020-01-19T22:37:02.257' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (53, 17, 2, CAST(N'2020-01-19T22:37:02.307' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (54, 17, 3, CAST(N'2020-01-19T22:37:02.340' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (55, 17, 3, CAST(N'2020-01-19T22:37:08.433' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (56, 17, 11, CAST(N'2020-01-19T22:37:08.583' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (57, 17, 3, CAST(N'2020-01-19T22:37:08.620' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (58, 18, 1, CAST(N'2020-01-19T22:38:53.573' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (59, 18, 2, CAST(N'2020-01-19T22:38:53.627' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (60, 18, 3, CAST(N'2020-01-19T22:38:53.660' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (61, 18, 3, CAST(N'2020-01-19T22:39:04.887' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (62, 18, 11, CAST(N'2020-01-19T22:39:05.070' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (63, 18, 14, CAST(N'2020-01-19T22:39:05.097' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (64, 18, 15, CAST(N'2020-01-19T22:39:05.123' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (65, 18, 16, CAST(N'2020-01-19T22:39:05.160' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (66, 18, 3, CAST(N'2020-01-19T22:39:05.187' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (67, 19, 1, CAST(N'2020-01-19T22:53:37.267' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (68, 19, 2, CAST(N'2020-01-19T22:53:37.317' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (69, 19, 3, CAST(N'2020-01-19T22:53:37.350' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (70, 19, 3, CAST(N'2020-01-19T22:53:48.367' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (71, 19, 11, CAST(N'2020-01-19T22:53:48.517' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (72, 19, 14, CAST(N'2020-01-19T22:53:48.547' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (73, 19, 15, CAST(N'2020-01-19T22:53:48.583' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (74, 19, 16, CAST(N'2020-01-19T22:53:48.613' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (75, 19, 3, CAST(N'2020-01-19T22:53:48.657' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (76, 20, 1, CAST(N'2020-01-19T22:53:58.390' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (77, 20, 2, CAST(N'2020-01-19T22:53:58.433' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (78, 20, 3, CAST(N'2020-01-19T22:53:58.470' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (79, 20, 3, CAST(N'2020-01-19T22:54:04.183' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (80, 20, 11, CAST(N'2020-01-19T22:54:04.333' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (81, 20, 14, CAST(N'2020-01-19T22:54:04.363' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (82, 20, 15, CAST(N'2020-01-19T22:54:04.397' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (83, 20, 16, CAST(N'2020-01-19T22:54:04.433' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (84, 20, 3, CAST(N'2020-01-19T22:54:04.467' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (85, 21, 1, CAST(N'2020-01-19T22:54:57.040' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (86, 21, 2, CAST(N'2020-01-19T22:54:57.090' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (87, 21, 3, CAST(N'2020-01-19T22:54:57.123' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (88, 21, 3, CAST(N'2020-01-19T22:55:08.903' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (89, 21, 11, CAST(N'2020-01-19T22:55:09.063' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (90, 21, 14, CAST(N'2020-01-19T22:55:09.093' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (91, 21, 15, CAST(N'2020-01-19T22:55:09.127' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (92, 21, 16, CAST(N'2020-01-19T22:55:09.160' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (93, 21, 3, CAST(N'2020-01-19T22:55:09.193' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (94, 21, 3, CAST(N'2020-01-19T22:55:15.063' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (95, 21, 6, CAST(N'2020-01-19T22:55:15.233' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (96, 21, 18, CAST(N'2020-01-19T22:55:15.443' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (97, 21, 18, CAST(N'2020-01-19T22:55:20.983' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (98, 21, 23, CAST(N'2020-01-19T22:55:21.233' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (99, 21, 3, CAST(N'2020-01-19T22:55:21.280' AS DateTime))
GO
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (100, 21, 3, CAST(N'2020-01-19T22:55:26.350' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (101, 21, 6, CAST(N'2020-01-19T22:55:26.493' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (102, 21, 18, CAST(N'2020-01-19T22:55:26.680' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (103, 21, 18, CAST(N'2020-01-19T22:55:40.033' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (104, 21, 23, CAST(N'2020-01-19T22:55:40.243' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (105, 21, 3, CAST(N'2020-01-19T22:55:40.280' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (106, 21, 3, CAST(N'2020-01-19T22:56:31.300' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (107, 21, 6, CAST(N'2020-01-19T22:56:31.443' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (108, 21, 18, CAST(N'2020-01-19T22:56:31.607' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (109, 22, 1, CAST(N'2020-01-19T22:57:16.153' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (110, 22, 2, CAST(N'2020-01-19T22:57:16.190' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (111, 22, 3, CAST(N'2020-01-19T22:57:16.223' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (112, 22, 3, CAST(N'2020-01-19T22:57:23.223' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (113, 22, 6, CAST(N'2020-01-19T22:57:23.400' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (114, 22, 18, CAST(N'2020-01-19T22:57:23.597' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (115, 22, 18, CAST(N'2020-01-19T22:57:29.550' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (116, 22, 23, CAST(N'2020-01-19T22:57:29.803' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (117, 22, 3, CAST(N'2020-01-19T22:57:29.830' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (118, 22, 3, CAST(N'2020-01-19T22:58:13.233' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (119, 22, 6, CAST(N'2020-01-19T22:58:13.383' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (120, 22, 18, CAST(N'2020-01-19T22:58:13.543' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (121, 22, 18, CAST(N'2020-01-19T22:58:31.953' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (122, 22, 23, CAST(N'2020-01-19T23:00:44.380' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (123, 22, 3, CAST(N'2020-01-19T23:00:44.420' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (124, 23, 1, CAST(N'2020-01-19T23:00:48.847' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (125, 23, 2, CAST(N'2020-01-19T23:00:48.883' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (126, 23, 3, CAST(N'2020-01-19T23:00:48.917' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (127, 23, 3, CAST(N'2020-01-19T23:00:52.443' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (128, 23, 6, CAST(N'2020-01-19T23:00:52.593' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (129, 23, 18, CAST(N'2020-01-19T23:00:52.770' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (130, 24, 1, CAST(N'2020-01-19T23:02:22.847' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (131, 24, 2, CAST(N'2020-01-19T23:02:38.847' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (132, 24, 3, CAST(N'2020-01-19T23:02:38.890' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (133, 24, 3, CAST(N'2020-01-19T23:02:48.677' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (134, 24, 6, CAST(N'2020-01-19T23:02:48.937' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (135, 24, 18, CAST(N'2020-01-19T23:02:49.100' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (136, 25, 1, CAST(N'2020-01-19T23:05:34.057' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (137, 25, 1, CAST(N'2020-01-19T23:05:34.057' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (138, 25, 2, CAST(N'2020-01-19T23:05:34.097' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (139, 25, 3, CAST(N'2020-01-19T23:05:34.133' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (140, 25, 3, CAST(N'2020-01-19T23:05:43.383' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (141, 25, 3, CAST(N'2020-01-19T23:05:43.383' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (142, 25, 6, CAST(N'2020-01-19T23:05:43.623' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (143, 26, 1, CAST(N'2020-01-19T23:07:07.100' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (144, 26, 1, CAST(N'2020-01-19T23:07:07.100' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (145, 26, 2, CAST(N'2020-01-19T23:07:07.133' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (146, 26, 3, CAST(N'2020-01-19T23:07:07.167' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (147, 27, 1, CAST(N'2020-01-19T23:08:30.557' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (148, 27, 2, CAST(N'2020-01-19T23:08:30.597' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (149, 27, 3, CAST(N'2020-01-19T23:08:30.637' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (150, 27, 3, CAST(N'2020-01-19T23:08:30.637' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (151, 28, 1, CAST(N'2020-01-19T23:09:15.490' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (152, 28, 2, CAST(N'2020-01-19T23:09:15.533' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (153, 28, 3, CAST(N'2020-01-19T23:09:15.577' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (154, 28, 3, CAST(N'2020-01-19T23:09:23.317' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (155, 28, 6, CAST(N'2020-01-19T23:09:23.573' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (156, 28, 6, CAST(N'2020-01-19T23:09:30.167' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (157, 28, 18, CAST(N'2020-01-19T23:09:30.350' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (158, 28, 18, CAST(N'2020-01-19T23:09:37.370' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (159, 28, 23, CAST(N'2020-01-19T23:09:37.580' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (160, 28, 3, CAST(N'2020-01-19T23:09:37.613' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (161, 28, 3, CAST(N'2020-01-19T23:09:44.957' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (162, 28, 6, CAST(N'2020-01-19T23:09:45.103' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (163, 28, 6, CAST(N'2020-01-19T23:09:53.820' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (164, 28, 20, CAST(N'2020-01-19T23:09:54.033' AS DateTime))
INSERT [dbo].[faqtb006_envio] ([nu_envio], [nu_sessao], [nu_conversa], [dh_envio]) VALUES (165, 28, 20, CAST(N'2020-01-19T23:09:57.540' AS DateTime))
SET IDENTITY_INSERT [dbo].[faqtb006_envio] OFF
INSERT [dbo].[faqtb007_tipo_conversa] ([ic_tipo_conversa], [no_tipo_conversa]) VALUES (N'A', N'AFIRMACAO')
INSERT [dbo].[faqtb007_tipo_conversa] ([ic_tipo_conversa], [no_tipo_conversa]) VALUES (N'C', N'CARTOES')
INSERT [dbo].[faqtb007_tipo_conversa] ([ic_tipo_conversa], [no_tipo_conversa]) VALUES (N'F', N'FIM')
INSERT [dbo].[faqtb007_tipo_conversa] ([ic_tipo_conversa], [no_tipo_conversa]) VALUES (N'I', N'INICIO')
INSERT [dbo].[faqtb007_tipo_conversa] ([ic_tipo_conversa], [no_tipo_conversa]) VALUES (N'Q', N'QUESTIONAMENTO')
SET IDENTITY_INSERT [dbo].[faqtb008_cartao] ON 

INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (1, 3, N'1', N'SEGUROS')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (2, 3, N'2', N'PREVIDÊNCIA COMPLEMENTAR ABERTA')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (4, 3, N'4', N'PLANOS POR SOBREVIVÊNCIA - VGBL e PGBL')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (5, 3, N'5', N'CAPITALIZAÇÃO')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (6, 6, N'1', N'Dúvidas referentes a todos os tipos de seguro')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (7, 6, N'2', N'Seguro de automóvel')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (8, 6, N'3', N'Seguro pessoal')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (10, 6, N'4', N'Seguro residencial')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (11, 6, N'5', N'Perguntas sobre DPVAT')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (12, 8, N'1', N'Todo plano de previdência complementar aberta permite resgate?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (13, 8, N'2', N'Existe algum tipo de atualização do valor do benefício e da contribuição ao longo da vigência do plano de previdência?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (14, 8, N'3', N'Quais os planos de previdência complementar aberta que posso utilizar para redução na base de cálculo do meu imposto de Renda?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (15, 8, N'4', N'Qual o tempo máximo para pagamento do benefício de um plano de previdência complementar aberta?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (16, 8, N'5', N'É certa a negativa do pagamento do benefício por uma doença pré-existente?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (17, 8, N'6', N'Minha contribuição aumentou excessivamente no mês anterior. Este procedimento é correto?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (18, 13, N'1', N'Pode-se adquirir um título para outra pessoa?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (19, 13, N'2', N'O título pode ser resgatado a qualquer momento?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (20, 13, N'3', N' Ao se resgatar o título no final do prazo de vigência, não se recebe tudo o que foi pago?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (21, 13, N'4', N'Prazo de vigência é o mesmo que prazo de pagamento?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (22, 18, N'1', N'As condições contratuais podem ser alteradas após a emissão da apólice?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (23, 18, N'2', N'O que se entende por perda de direito?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (24, 18, N'3', N'O que é prêmio do seguro?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (25, 18, N'4', N'O que acontece se houver atraso nos pagamentos dos prêmios?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (26, 18, N'5', N'A seguradora poderá recusar a proposta?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (27, 18, N'6', N'Qual o prazo para receber a indenização?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (28, 19, N'1', N'A seguradora é obrigada a renovar o meu seguro?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (29, 19, N'2', N'As apólices de seguros de pessoas podem ser alteradas durante a sua vigência?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (30, 19, N'3', N'O segurado pode contratar simultaneamente mais de um seguro de pessoas?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (31, 19, N'4', N'Os menores de 14 anos podem fazer seguro de vida?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (32, 19, N'5', N'Não havendo nomeação de beneficiário na apólice de seguro, qual o procedimento a ser seguido à época do pagamento da indenização?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (33, 19, N'6', N'Existe algum tipo de atualização do capital segurado e do prêmio (contribuição) ao longo da vigência do seguro?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (34, 19, N'7', N'A concessão de aposentadoria por invalidez, por instituições oficiais de previdência, significa que tenho direito à indenização por invalidez no seguro de pessoas?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (35, 19, N'8', N'No caso de divergências sobre a causa, natureza ou extensão de lesões, bem como sobre a avaliação da incapacidade relacionadas ao segurado, o que deve ser feito?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (36, 20, N'1', N'O que caracteriza a indenização integral em caso de ocorrência de sinistro?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (37, 20, N'2', N'Como devo proceder para o recebimento de indenização integral?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (38, 20, N'3', N'Como devo proceder para o recebimento de indenização parcial?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (39, 20, N'4', N' O que é franquia?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (40, 20, N'5', N'O que é bônus?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (41, 20, N'6', N'É possível o uso de peças não originais e/ou usadas no reparo de automóveis em caso de sinistro de perda parcial?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (42, 20, N'7', N'Se o meu perfil de risco mudar durante a vigência da apólice eu devo comunicar à Seguradora?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (43, 21, N'1', N'Quais as coberturas do seguro residencial?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (44, 21, N'2', N'O que são riscos cobertos e riscos excluídos?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (45, 21, N'3', N'O que são bens não compreendidos no seguro?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (46, 21, N'4', N'O que é franquia?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (48, 21, N'5', N'Quais as diferenças entre o seguro residencial e o seguro condomínio?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (49, 22, N'1', N'Quais as coberturas do Seguro DPVAT?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (50, 22, N'2', N'Qual o prazo para solicitar a indenização?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (51, 22, N'3', N'Há cobertura para danos materiais?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (52, 22, N'4', N'Quem pode requerer indenização do DPVAT?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (53, 22, N'5', N'Quem são os beneficiários do seguro?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (54, 22, N'6', N'Quais os procedimentos para recebimento da indenização do DPVAT?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (55, 22, N'7', N'As indenizações são cumulativas?')
INSERT [dbo].[faqtb008_cartao] ([nu_cartao], [nu_conversa], [vr_cartao], [de_cartao]) VALUES (56, 22, N'8', N'Quais seguradoras participam dos Consórcios DPVAT?')
SET IDENTITY_INSERT [dbo].[faqtb008_cartao] OFF
SET IDENTITY_INSERT [dbo].[faqtb009_variavel] ON 

INSERT [dbo].[faqtb009_variavel] ([nu_variavel], [no_variavel], [ic_tipo_variavel], [nu_dialogo]) VALUES (1, N'RESPOSTA', N'S', 1)
SET IDENTITY_INSERT [dbo].[faqtb009_variavel] OFF
ALTER TABLE [dbo].[faqtb002_conversa]  WITH CHECK ADD  CONSTRAINT [FK_faqtb002_conversa_faqtb001_dialogo] FOREIGN KEY([nu_dialogo])
REFERENCES [dbo].[faqtb001_dialogo] ([nu_dialogo])
GO
ALTER TABLE [dbo].[faqtb002_conversa] CHECK CONSTRAINT [FK_faqtb002_conversa_faqtb001_dialogo]
GO
ALTER TABLE [dbo].[faqtb002_conversa]  WITH CHECK ADD  CONSTRAINT [FK_faqtb002_conversa_faqtb007_tipo_conversa] FOREIGN KEY([ic_tipo_conversa])
REFERENCES [dbo].[faqtb007_tipo_conversa] ([ic_tipo_conversa])
GO
ALTER TABLE [dbo].[faqtb002_conversa] CHECK CONSTRAINT [FK_faqtb002_conversa_faqtb007_tipo_conversa]
GO
ALTER TABLE [dbo].[faqtb002_conversa]  WITH CHECK ADD  CONSTRAINT [FK_faqtb002_conversa_faqtb009_variavel] FOREIGN KEY([nu_variavel])
REFERENCES [dbo].[faqtb009_variavel] ([nu_variavel])
GO
ALTER TABLE [dbo].[faqtb002_conversa] CHECK CONSTRAINT [FK_faqtb002_conversa_faqtb009_variavel]
GO
ALTER TABLE [dbo].[faqtb003_regra]  WITH CHECK ADD  CONSTRAINT [FK_faqtb003_regra_faqtb002_conversa] FOREIGN KEY([nu_conversa_anterior])
REFERENCES [dbo].[faqtb002_conversa] ([nu_conversa])
GO
ALTER TABLE [dbo].[faqtb003_regra] CHECK CONSTRAINT [FK_faqtb003_regra_faqtb002_conversa]
GO
ALTER TABLE [dbo].[faqtb003_regra]  WITH CHECK ADD  CONSTRAINT [FK_faqtb003_regra_faqtb002_conversa1] FOREIGN KEY([nu_conversa_posterior])
REFERENCES [dbo].[faqtb002_conversa] ([nu_conversa])
GO
ALTER TABLE [dbo].[faqtb003_regra] CHECK CONSTRAINT [FK_faqtb003_regra_faqtb002_conversa1]
GO
ALTER TABLE [dbo].[faqtb004_sessao]  WITH CHECK ADD  CONSTRAINT [FK_faqtb004_sessao_faqtb001_dialogo] FOREIGN KEY([nu_dialogo])
REFERENCES [dbo].[faqtb001_dialogo] ([nu_dialogo])
GO
ALTER TABLE [dbo].[faqtb004_sessao] CHECK CONSTRAINT [FK_faqtb004_sessao_faqtb001_dialogo]
GO
ALTER TABLE [dbo].[faqtb005_resposta]  WITH CHECK ADD  CONSTRAINT [FK_faqtb005_resposta_faqtb002_conversa] FOREIGN KEY([nu_conversa])
REFERENCES [dbo].[faqtb002_conversa] ([nu_conversa])
GO
ALTER TABLE [dbo].[faqtb005_resposta] CHECK CONSTRAINT [FK_faqtb005_resposta_faqtb002_conversa]
GO
ALTER TABLE [dbo].[faqtb005_resposta]  WITH CHECK ADD  CONSTRAINT [FK_faqtb005_resposta_faqtb004_sessao] FOREIGN KEY([nu_sessao])
REFERENCES [dbo].[faqtb004_sessao] ([nu_sessao])
GO
ALTER TABLE [dbo].[faqtb005_resposta] CHECK CONSTRAINT [FK_faqtb005_resposta_faqtb004_sessao]
GO
ALTER TABLE [dbo].[faqtb005_resposta]  WITH CHECK ADD  CONSTRAINT [FK_faqtb005_resposta_faqtb009_variavel] FOREIGN KEY([nu_variavel])
REFERENCES [dbo].[faqtb009_variavel] ([nu_variavel])
GO
ALTER TABLE [dbo].[faqtb005_resposta] CHECK CONSTRAINT [FK_faqtb005_resposta_faqtb009_variavel]
GO
ALTER TABLE [dbo].[faqtb006_envio]  WITH CHECK ADD  CONSTRAINT [FK_faqtb006_envio_faqtb002_conversa] FOREIGN KEY([nu_conversa])
REFERENCES [dbo].[faqtb002_conversa] ([nu_conversa])
GO
ALTER TABLE [dbo].[faqtb006_envio] CHECK CONSTRAINT [FK_faqtb006_envio_faqtb002_conversa]
GO
ALTER TABLE [dbo].[faqtb006_envio]  WITH CHECK ADD  CONSTRAINT [FK_faqtb006_envio_faqtb004_sessao] FOREIGN KEY([nu_sessao])
REFERENCES [dbo].[faqtb004_sessao] ([nu_sessao])
GO
ALTER TABLE [dbo].[faqtb006_envio] CHECK CONSTRAINT [FK_faqtb006_envio_faqtb004_sessao]
GO
ALTER TABLE [dbo].[faqtb008_cartao]  WITH CHECK ADD  CONSTRAINT [FK_faqtb008_cartao_faqtb002_conversa] FOREIGN KEY([nu_conversa])
REFERENCES [dbo].[faqtb002_conversa] ([nu_conversa])
GO
ALTER TABLE [dbo].[faqtb008_cartao] CHECK CONSTRAINT [FK_faqtb008_cartao_faqtb002_conversa]
GO
ALTER TABLE [dbo].[faqtb009_variavel]  WITH CHECK ADD  CONSTRAINT [FK_faqtb009_variavel_faqtb001_dialogo] FOREIGN KEY([nu_dialogo])
REFERENCES [dbo].[faqtb001_dialogo] ([nu_dialogo])
GO
ALTER TABLE [dbo].[faqtb009_variavel] CHECK CONSTRAINT [FK_faqtb009_variavel_faqtb001_dialogo]
GO
