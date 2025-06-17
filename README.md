# פרויקט DevOps - EKS עם Terraform, Docker, Helm ו-GitHub Actions

## 🚀 סקירה כללית
פרויקט זה מדגים את התהליך המלא של פריסת אפליקציית Flask על AWS EKS, כולל:
- תשתית AWS מוגדרת באמצעות Terraform
- אפליקציית Flask במיכל Docker
- פריסה באמצעות Helm
- אוטומציה של התהליך עם GitHub Actions

## 📋 דרישות מקדימות
- חשבון AWS עם הרשאות מתאימות
- AWS CLI מותקן ומוגדר
- Terraform מותקן (גרסה 1.0.0 ומעלה)
- kubectl מותקן
- Docker מותקן
- Helm מותקן (גרסה 3.0.0 ומעלה)

## 🏗️ מבנה הפרויקט
```
.
├── app/                    # קוד האפליקציה
├── terraform/             # קוד Terraform לתשתית AWS
├── helm-chart/           # תרשים Helm לפריסת האפליקציה
└── .github/              # הגדרות GitHub Actions
```

## 🚀 התקנה והפעלה

### 1. הגדרת תשתית AWS עם Terraform
```bash
cd terraform
terraform init
terraform plan
terraform apply
```

### 2. בניית והעלאת תמונת Docker
```bash
cd app
docker build -t flask-app .
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <ECR_REPO_URL>
docker tag flask-app:latest <ECR_REPO_URL>:latest
docker push <ECR_REPO_URL>:latest
```

### 3. פריסת האפליקציה עם Helm
```bash
cd helm-chart
helm install flask-app ./flask-app
```

## 🔄 אוטומציה עם GitHub Actions
הפרויקט כולל שני workflows:
1. `terraform.yml` - מפרסם את התשתית ב-AWS
2. `deploy.yml` - בונה ומפרסם את האפליקציה

## 📊 ניטור
הפרויקט כולל ניטור באמצעות:
- Prometheus - לאיסוף מטריקות
- Grafana - להצגת דשבורדים
- CloudWatch - לניטור AWS

## 🔒 אבטחה
- שימוש ב-IAM roles עם הרשאות מינימליות
- רשת VPC מוגדרת עם subnets ציבוריים ופרטיים
- אבטחת תמונות Docker
- הצפנת נתונים במנוחה

## 💰 אופטימיזציה לעלויות
- שימוש ב-Spot Instances עבור Node Groups
- הגדרת Auto Scaling
- ניהול משאבים יעיל

## 🛠️ כלים וטכנולוגיות
- AWS EKS
- Terraform
- Docker
- Helm
- GitHub Actions
- Prometheus & Grafana
- Flask

## 📝 הערות חשובות
- יש לוודא שכל המשתנים הסביבתיים מוגדרים כראוי
- מומלץ לבדוק את הגדרות האבטחה לפני פריסה לסביבת ייצור
- יש לעקוב אחר עלויות AWS באופן שוטף

## 🤝 תרומה לפרויקט
מוזמנים לתרום לפרויקט על ידי:
1. Fork של הרפוזיטורי
2. יצירת branch חדש
3. שליחת Pull Request

## �� רישיון
MIT License 