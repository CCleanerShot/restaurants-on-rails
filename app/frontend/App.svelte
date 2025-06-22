<script>
    import Counter from "./components/Counter.svelte";
    import { testState } from "./states/testState.svelte.ts"

</script>

<div>
    {testState.number}
    <div>App</div>
    <Counter/>
</div>