output "tg_arn" {
  value = aws_lb_target_group.tg.arn
}

output "alb_dns" {
  value = aws_alb.this.dns_name
}