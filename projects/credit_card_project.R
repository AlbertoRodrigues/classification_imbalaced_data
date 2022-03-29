require(ggplot2)
require(reticulate)
dados=read.csv("\\Users\\alber\\OneDrive\\Desktop\\projetos\\classification_imbalanced_data\\credit_card_clients.csv")

#Verificando as variáveis para fazer um pre processamento

colnames(dados)[ncol(dados)]="y"
categorical_variables=c("SEX", "EDUCATION", "MARRIAGE"
                        , "y", "PAY_0"
  , "PAY_2", "PAY_3", "PAY_4", "PAY_5", "PAY_6")
dados[,categorical_variables]=lapply(dados[,categorical_variables], as.factor)
#Quantidade de níveis em cada variavel categorica
lapply(dados[,categorical_variables], table)

summary(dados)


table(dados$y)/nrow(dados)

(ggplot()+geom_bar(aes(x=dados$y))
+labs(x="Classe", y="Quantidade"))




#Separação em treino e teste
X=dados[,-which(colnames(dados)=="y")]
y=dados$y

sk=import("sklearn")
amostra=sk$model_selection$train_test_split(X, y, shuffle=TRUE,
                                            test_size=0.3, stratify=y)

X_treino=data.frame(amostra[[1]])
X_teste=amostra[[2]]
y_treino=amostra[[3]]
y_teste=amostra[[4]]

table(y_treino)/length(y_treino)
table(y_teste)/length(y_teste)


#Seleção de variáveis
#data=data.frame(y_treino, unlist(X_treino))
#Erro no X treino
data=cbind.data.frame(X_treino, y_treino)
model_sel_var = glm(as.factor(y_treino)~., data=data,family=binomial(link="logit"))
summary(model_sel_var)

min.model = glm(as.factor(y_treino)~1, data=data,family=binomial(link="logit"))

fwd.model = step(min.model, direction='forward', 
scope=formula(glm(as.factor(y_treino)~., data=data,family=binomial(link="logit"))))

dim(fwd.model$model)

#Variáveis selecionadas
X_treino2=X_treino[,colnames(fwd.model$model)[-1]]
X_teste2=X_teste[,colnames(fwd.model$model)[-1]]


#Machine learning