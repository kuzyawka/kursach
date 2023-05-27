<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel = "stylesheet" href = "{{ url_for('static', filename = 'css/main.css') }}">
    <link rel="stylesheet" href = "https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <title>{% block title %}{% endblock %}</title>
</head>
<body>
<div class = "container">
<header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
      <a href="/home" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
        <span class="fs-4">Zoo</span>
      </a>

      <ul class="nav nav-pills">
        <li class="nav-item"><a href="/home" class="nav-link active" aria-current="page">Главная</a></li>
        <li class="nav-item"><a href="/about" class="nav-link">Новости</a></li>
        <li class="nav-item"><a href="/tickets" class="nav-link">Волонтерство</a></li>
      </ul>

        <li class="btn btn-warning"><a href="/create_article" class="nav-link active">Создать</a></li>

    </header>
</div>
{% block body %}{% endblock %}


<footer class="container pt-4 my-md-5 pt-md-5 border-top">
    <div class="row">
      <div class="col-6 col-md">
        <h5>Больше информации</h5>
        <ul class="list-unstyled text-small">
          <li class="mb-1"><a class="link-secondary text-decoration-none" href="#">О содержании животных</a></li>
          <li class="mb-1"><a class="link-secondary text-decoration-none" href="#">Фотографии</a></li>
          <li class="mb-1"><a class="link-secondary text-decoration-none" href="#">Отзывы</a></li>

        </ul>
      </div>
      <div class="col-6 col-md">
        <h5>Где заказать</h5>
        <ul class="list-unstyled text-small">
          <li class="mb-1"><a class="link-secondary text-decoration-none" href="/tickets">Билеты</a></li>

        </ul>
      </div>
      <div class="col-6 col-md">
        <h5>Новости про</h5>
        <ul class="list-unstyled text-small">
          <li class="mb-1"><a class="link-secondary text-decoration-none" href="/about">Ушастиков</a></li>


        </ul>
      </div>
    </div>
  </footer>


</body>
</html>
