<template>
  <div>
    <HeaderView v-bind:title="initialData.title" v-bind:description="initialData.description" />
    <Contents v-bind:clothes="initialData.clothes" v-bind:processings="initialData.processings" />
  </div>
</template>

<script>
import HeaderView from "../HeaderView.vue";
import Contents from "./Contents.vue";

export default {
  components: {
    HeaderView,
    Contents
  },
  props: {
    initialData: {
      type: Object,
      default: () => { }
    }
  },
};
</script>

<style scoped></style>