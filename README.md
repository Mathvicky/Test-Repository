# AWS CloudFormation DevOps Project

A beginner DevOps project that deploys a highly available, containerized Nginx website on AWS using Infrastructure as Code.

## Technologies

- AWS CloudFormation
- Amazon VPC and EC2
- Application Load Balancer
- Auto Scaling Group
- Docker and Nginx
- GitHub
- Prometheus
- Grafana
- Node Exporter
- Bash

## Architecture

Internet → Application Load Balancer → Auto Scaling Group → Dockerized Nginx EC2 instances

Monitoring EC2 → Prometheus → Node Exporter → Grafana Dashboard

## AWS Resources

- Custom VPC
- Two public subnets in separate Availability Zones
- Internet Gateway and public route table
- Security groups
- EC2 launch template
- Auto Scaling Group: minimum 2, desired 2, maximum 4
- CPU target-tracking policy
- Application Load Balancer
- Monitoring EC2 instance

## Project Structure
```text
cloudformation/
  main.yaml

monitoring/
  compose.yaml
  prometheus.yml
```
## Deployment

1. Open AWS CloudFormation.
2. Select Europe (London), `eu-west-2`.
3. Create a stack using `cloudformation/main.yaml`.
4. Wait for `CREATE_COMPLETE`.
5. Open `LoadBalancerURL` from the stack Outputs.
   
## Monitoring

- Prometheus runs on port `9090`
- Grafana runs on port `3000`
- Node Exporter dashboard ID: `1860`

Prometheus collects Node Exporter metrics. Grafana displays CPU, memory, disk, network, and uptime information.

## Result

Nginx runs in Docker containers across two EC2 instances. The Application Load Balancer distributes traffic, Auto Scaling maintains availability, and Prometheus with Grafana provides monitoring.

## Cleanup

Delete the CloudFormation stack after testing to stop ongoing AWS charges.

## Security Note

Public monitoring ports are used for training only. Production systems should restrict access and use HTTPS and authentication.
