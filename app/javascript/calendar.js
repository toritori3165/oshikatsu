function calendar() {
  // カレンダーBを非表示にする
  document.getElementById('calendar-b').style.display = 'none';

  // チェックボックスのイベントリスナーを追加する
  document.getElementById('toggle-calendar-b').addEventListener('change', function() {
    if (this.checked) {
      document.getElementById('calendar-a').style.display = 'none';
      document.getElementById('calendar-b').style.display = 'block';
    } else {
      document.getElementById('calendar-a').style.display = 'block';
      document.getElementById('calendar-b').style.display = 'none';
    }
  });
}

document.addEventListener("DOMContentLoaded", calendar);
document.addEventListener("turbo:load", calendar);
document.addEventListener("turbo:render", calendar);