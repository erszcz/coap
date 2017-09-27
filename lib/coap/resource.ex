defmodule Coap.Resource do
  defmacro __using__(_) do
    quote do
      import Coap.Records

      @behaviour :coap_resource

      def start(path, params) do
        :coap_server_registry.add_handler(path, __MODULE__, params)
      end

      def coap_discover(prefix, args) do
        [{:absolute, prefix, args}]
      end

      def coap_get(_ch_id, _prefix, _name, _query, _request) do
        coap_content()
      end

      def coap_post(_ch_id, _prefix, _name, _content, _request) do
        {:ok, :content, coap_content()}
      end

      def coap_put(_ch_id, _prefix, _name, _content, _request) do
        :ok
      end

      def coap_delete(_ch_id, _prefix, _name, _request) do
        :ok
      end

      def coap_observe(ch_id, prefix, name, _ack, _request) do
        {:ok, {:state, prefix, name}}
      end

      def coap_unobserve({_state, _prefix, _name}) do
        :ok
      end

      def handle_info(_message, state) do
        {:noreply, state}
      end

      def coap_ack(_ref, state) do
        {:ok, state}
      end

      defoverridable [start: 2, coap_discover: 2, coap_get: 5, coap_post: 5, coap_put: 5,
        coap_delete: 4, coap_observe: 5, coap_unobserve: 1, handle_info: 2, coap_ack: 2]
    end
  end
end
