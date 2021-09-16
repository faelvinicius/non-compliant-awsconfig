### AWS Config + Zabbix + Grafana

A um tempo atrás me deparei com um desafio que era dar visibilidade na quantidade de recursos criados em mais de 15 contas da AWS que faziam parte de uma Organization.
A ideia era mostrar isso de uma forma centralizada no Grafana. Então tive a ideia de habilitar o AWS Config aonde ele me mostra um inventário de toda a conta. Com o config habilitado eu adicionei as seguintes regras para me mostrar o que não estava em conformidade no ambiente.
As regras foram:
- s3-bucket-public-read-prohibited<br/>
Regra que mostra quais buckets s3 estão públicos.
- rds-instance-public-access-check<br/>
Regra que mostra quais instâncias RDS estão públicas.
- ec2-instance-no-public-ip<br/>
Regra que mostra quais instâncias estão com IP público.
- vpc-sg-open-only-to-authorized-ports<br/>
Regra que mostra quais portas em um Security Group estão apontando para range 0.0.0.0/0.
- iam-user-mfa-enabled<br/>
Regra que mostra quais contas de IAM User não estão com o MFA habilitado.

### Exemplo do dahsboard no Grafana
![Screenshot](prints/dash-grafana.png)