package spacelift

deny[msg] {
  input.run.type == "DESTROY"
  input.stack.environment == "prod"
  msg := "Destroy operations in prod require manual approval"
}
