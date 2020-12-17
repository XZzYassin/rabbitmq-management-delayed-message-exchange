FROM rabbitmq:3-management

RUN apt-get update && \
    apt-get install -y curl

ARG DELAY_PLUGIN_URL=https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/3.8.9/rabbitmq_delayed_message_exchange-3.8.9-0199d11c.ez

RUN curl -L $DELAY_PLUGIN_URL --output "${DELAY_PLUGIN_URL##*/}" && \
mv "${DELAY_PLUGIN_URL##*/}" plugins/

RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange
