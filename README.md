# Desafio Go - Full Cycle

Este repositório contém a solução para o desafio do módulo de Docker do curso Full Cycle. O objetivo era criar uma aplicação em Go que, ao ser executada via um container Docker, exibisse a mensagem "Full Cycle Rocks!!", com a restrição de que a imagem final tivesse menos de 2MB.

## 🚀 O Desafio

O desafio consistia nos seguintes pontos:

1.  **Desenvolver uma aplicação em Go** que imprimisse a string `Full Cycle Rocks!!` no console.
2.  **Criar um `Dockerfile`** para containerizar a aplicação.
3.  **Otimizar a imagem Docker** para que seu tamanho final fosse **inferior a 2MB**.
4.  **Publicar a imagem** no Docker Hub.
5.  **Disponibilizar o código-fonte** em um repositório Git.

## 🛠️ Solução Proposta

Para atender a todos os requisitos, especialmente o de tamanho da imagem, foi adotada uma estratégia de construção em múltiplos estágios (`multi-stage build`) no Dockerfile, combinada com a compressão do binário executável.

### 1. Aplicação Go (`main.go`)

A aplicação é um simples "Olá, Mundo!" que apenas imprime a mensagem solicitada.

```go
package main

import "fmt"

func main() {
  fmt.Println("Full Cycle Rocks!!")
}
```

### 2. Otimização com Dockerfile

O `Dockerfile` foi a peça central para a otimização. Ele foi dividido em dois estágios:

### Estágio 1: builder

- **Imagem Base:** `golang:1.22-alpine`. Uma imagem leve que já contém todo o ambiente Go necessário para a compilação.

- **Compilação Estática:** O código Go foi compilado com as flags `-ldflags="-s -w"` para remover símbolos de debug e com `CGO_ENABLED=0` para garantir que o binário não tenha dependências externas de bibliotecas C, tornando-o totalmente autossuficiente.

O Dockerfile completo pode ser encontrado [neste link](https://github.com/gabrielqueirozdev/docker-fullcycle-3.0/blob/main/Dockerfile).

## ✅ Resultados

- **Imagem no Docker Hub:** queirozg96/fullcycle

- **Tamanho Final da Imagem:** ~1.81MB

- **Link:** [https://hub.docker.com/r/queirozg96/fullcycle](https://hub.docker.com/r/queirozg96/fullcycle).

## 🏃 Como Executar

Para testar a imagem, basta executar o seguinte comando no seu terminal:

```shell
docker run queirozg96/fullcycle
```

A saída esperada
```
Full Cycle Rocks!!
```