from api.models import API_KEYS


def authAPI(request):
    apiKey = request.headers.get('ApiKey')
    model_data = API_KEYS.objects.filter(Hash=apiKey).first()
    if model_data:
        return model_data
    else:
        context = {
            'Message': 'Your request was rejected due to API_KEY mismatch',
            'Status': 900
        }
        return context


def checkInput(request, listInput):
    for item in listInput:
        if not request.data.get('{}'.format(item)):
            context = {
                'Status': 901,
                'Message': 'The input is incomplete'
            }
            return context
    return 1
