<template>
  <div>
    <table class="contents-table">
      <tr>
        <th>衣類選択</th>
        <th>料金</th>
      </tr>
      <tr>
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
      selected: ''
    };
  },
  methods: {
    SelectedPrice: function() {
      const item = this.content.find(({name}) => name === this.selected);
      return item ? item.price : 0;
    },
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