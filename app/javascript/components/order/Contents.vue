<template>
  <div>
    <button @click="increment">+</button>
    <button @click="decrement">-</button>
    <table class="contents-table">
      <tr>
        <th>衣類選択</th>
        <th>料金</th>
      </tr>
      <tr v-for="(_) in counter">
        <td>
          <select v-model="selected">
            <option disabled value="">依頼する衣類を一つずつお選びください</option>
            <option v-for="(content, index) in contents" :key="index" :value="content.name">
              {{ content.name }}
            </option>
          </select>
        </td>
        <td>
          <a>{{ SelectedPrice }}</a>
        </td>
      </tr>
    </table>
  </div>
</template>

<script>
export default {
  props: {
    contents: {
      type: Array,
      default: () => []
    }
  },
  data() {
    return {
      selected: '',
      counter: 3
    };
  },
  computed: {
    SelectedPrice: function () {
      if (!this.selected) return 0;
      const item = this.contents.find(({ name }) => name === this.selected);
      return item ? item.price : 0;
    },
  },
  methods: {
    increment() {
      this.counter++;
    },
    decrement() {
      this.counter--;
    }
  },
};
</script>

<style scoped>
.contents-table {
  border: 1px solid gray;
  margin: 10px;
}

.contents-table th,
.contents-table td {
  border: 1px solid gray;
}
</style>