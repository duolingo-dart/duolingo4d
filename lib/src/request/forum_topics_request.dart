import 'package:duolingo4d/src/adapter/forum_topics_adapter.dart';
import 'package:duolingo4d/src/endpoint.dart';
import 'package:duolingo4d/src/request/internal_session.dart';
import 'package:duolingo4d/src/request/request.dart';
import 'package:duolingo4d/src/resource.dart';
import 'package:duolingo4d/src/response/forumtopics/forum_topics_response.dart';
import 'package:http/http.dart' as http;

class ForumTopicsRequest extends Request<ForumTopicsResponse> {
  /// Returns the new instance of [OverviewRequest].
  ForumTopicsRequest.newInstance();

  /// The response adapter
  static final _adapter = ForumTopicsAdapter.newInstance();

  /// The API uri
  static final _apiUri =
      Uri.parse('${Endpoint.forum.url}/${Resource.forumTopics.url}');

  @override
  Future<ForumTopicsResponse> send() async => _adapter.convert(
        response: await http.get(
          _apiUri,
          headers: InternalSession.instance.headers,
        ),
      );
}
