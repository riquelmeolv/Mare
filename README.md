# Maré — GitHub Pages + Supabase

## Configuração (uma vez)
1. Crie um projeto em https://supabase.com/dashboard.
2. Abra **SQL Editor** e execute o arquivo `supabase.sql` inteiro (uma vez). Se rodar novamente, as políticas já criadas causarão erro; não precisa repetir.
3. Em **Authentication > Providers > Email**, mantenha o login por e-mail habilitado. Para uso privado, desabilite **Allow new users to sign up** nas configurações de Auth.
4. Em **Authentication > Users > Add user**, crie sua conta com e-mail e senha e marque a opção de confirmação do e-mail, se aparecer. Não compartilhe sua senha.
5. Em **Project Settings > API** (ou **Connect > API keys**), copie a **Project URL** e a chave **publishable** (ou a antiga **anon**). Cole em `config.js`. **Nunca** use a chave `service_role`, `secret` ou sua senha.
6. Crie um repositório no GitHub e envie `index.html`, `config.js` e `supabase.sql` (o SQL é apenas a configuração, não contém credenciais).
7. Em **Settings > Pages**, escolha **Deploy from a branch**, `main`, `/ (root)`, e salve. Aguarde o link do GitHub Pages.
8. Abra seu site e faça login. Em **Biblioteca**, escolha um arquivo e clique em **Salvar material**.

## Observações importantes
- GitHub Pages publica o código, mas seus arquivos ficam no **bucket privado** do Supabase. O acesso é limitado ao usuário autenticado por políticas RLS.
- `config.js` é público: isso é esperado para a chave **publishable/anon**, que NÃO é senha nem chave administrativa. A proteção real é o RLS configurado no SQL.
- A versão salva todo o planejamento em um documento JSON por usuário. É adequada a uso pessoal, mas editar simultaneamente em dois aparelhos pode causar sobrescrita da última gravação.
- Se já usava a versão anterior no mesmo navegador, ao primeiro login você pode importar seus dados locais. Para outras migrações, use Exportar/Importar.
- Arquivos antigos que estavam salvos como dados locais não são migrados automaticamente para Storage: reenvie-os se necessário.
- Não envie informações confidenciais sem revisar a configuração e manter a conta segura.
- O limite do upload nesta versão é de 20 MB por arquivo, sujeito aos limites do plano Supabase.
- Para abrir um documento, o app cria um link temporário de 60 segundos.
- Se o navegador bloquear a abertura de nova aba, permita pop-ups para o site.
- A aplicação depende da conexão com Supabase e da biblioteca JavaScript carregada por CDN.
