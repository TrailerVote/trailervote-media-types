import {AudioFragmentIndexV1, AudioFragmentV1 } from '../application/vnd.trailervote.audio_fragment'
import {CarouselV1} from '../application/vnd.trailervote.carousel'
import {ClientConfigurationV1} from '../application/vnd.trailervote.client_configuration'
import {ConfigurationV1, ConfigurationV2, ConfigurationV3, ConfigurationV4, ConfigurationV5} from '../application/vnd.trailervote.configuration'
import { ErrorsV1 } from '../application/vnd.trailervote.errors'
import { FeedbackV1, FeedbackCreateV1, FeedbackCollectionV1 } from '../application/vnd.trailervote.feedback'
import { FeedbackListingV1 } from '../application/vnd.trailervote.feedback_listing'
import { InteractivePlayerV1 } from '../application/vnd.trailervote.interactive_player'
import { IssueCreateV1, IssueIndexV1, IssueV1 } from '../application/vnd.trailervote.issue'
import { PersonaV1, PersonaV2 } from '../application/vnd.trailervote.persona'
import { PlaceV1, PlaceV2, PlaceV3, PlaceV4 } from '../application/vnd.trailervote.place'
import { ProductImageV1, ProductImageIndexV1 } from '../application/vnd.trailervote.product.image'
import { ProductLookupV1 } from '../application/vnd.trailervote.product.lookup'
import { ProductV1, ProductV2, ProductIndexV1, ProductIndexV2 } from '../application/vnd.trailervote.product'
import { ProductVideoV1, ProductVideoIndexV1 } from '../application/vnd.trailervote.product.video'
import { ProductListingV1 } from '../application/vnd.trailervote.products_listing'
import { PushTrivialCampaignV1, PushTrivialCampaignV2, PushTrivialCampaignV3, PushTrivialCampaignV4, PushTrivialCampaignV5, PushTrivialCampaignCreateV1, PushTrivialCampaignCreateV2, PushTrivialCampaignCreateV3, PushTrivialCampaignCreateV4, PushTrivialCampaignCreateV5 } from '../application/vnd.trailervote.push_trivial_campaign'
import { PushManifestV1 } from '../application/vnd.trailervote.push_manifest'
import { SentimentFeedbackV1 } from '../application/vnd.trailervote.sentiment_feedback'




import audioJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.audio_fragment.v1.json'
import audioIndexJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.audio_fragment.v1.index.json'
// import audioOrderedJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.audio_fragment.v1.ordered.json'
import carouselJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.carousel.v1.json'
import clientConfigurationJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.client_configuration.v1.json'
import configurationV1Json from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.configuration.v1.json'
import configurationV2Json from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.configuration.v2.json'
import configurationV3Json from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.configuration.v3.json'
import configurationV4Json from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.configuration.v4.json'
import configurationV5Json from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.configuration.v5.json'
import ErrorsJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.errors.v1.json'
import FeedbackJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.feedback.v1.json'
import FeedbackCreateJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.feedback.v1.create.json'
import FeedbackCollectionJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.feedback.v1.collection.json'
import FeedbackListingJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.feedback_listing.v1.json'
import InteractivePLayerJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.interactive_player.v1.json'
import IssueJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.issue.v1.json'
import IssueCreateJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.issue.v1.create.json'
import IssueIndexJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.issue.v1.index.json'
import Persona1Json from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.persona.v1.json'
import Persona2Json from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.persona.v2.json'
import PlaceV1Json from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.place.v1.json'
import PlaceV2Json from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.place.v2.json'
import PlaceV3Json from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.place.v3.json'
import PlaceV4Json from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.place.v4.json'
import ProductImageJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.product.image.v1.json'
import ProductImageIndexJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.product.image.v1.index.json'
import ProductLookupJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.product.lookup.v1.json'
import ProductV1Json from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.product.v1.json'
import ProductV1IndexJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.product.v1.index.json'
import ProductV2Json from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.product.v2.json'
import ProductV2IndexJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.product.v2.index.json'
import ProductVideoJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.product.video.v1.json'
import ProductVideoIndexJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.product.video.v1.index.json'
import ProductsListingJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.products_listing.v1.json'
import PushTrivialCampaignV1Json from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.push_campaign_trivial.v1.json'
import PushTrivialCampaignV2Json from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.push_campaign_trivial.v2.json'
import PushTrivialCampaignV3Json from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.push_campaign_trivial.v3.json'
import PushTrivialCampaignV4Json from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.push_campaign_trivial.v4.json'
import PushTrivialCampaignV5Json from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.push_campaign_trivial.v5.json'
import PushTrivialCampaignV1CreateJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.push_campaign_trivial.v1.create.json'
import PushTrivialCampaignV2CreateJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.push_campaign_trivial.v2.create.json'
import PushTrivialCampaignV3CreateJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.push_campaign_trivial.v3.create.json'
import PushTrivialCampaignV4CreateJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.push_campaign_trivial.v4.create.json'
import PushTrivialCampaignV5CreateJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.push_campaign_trivial.v5.create.json'
import PushManifestJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.push_manifest.v1.json'
import SentimentFeedbackJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.sentiment_feedback.v1.json'

// Fixtures can not be imported with their original names.
// Run yarn fix-fixtures to fix their names

const audio = audioJson as AudioFragmentV1
const audioIndex = audioIndexJson as AudioFragmentIndexV1

const carousel = carouselJson as CarouselV1

const clientConfiguration = clientConfigurationJson as ClientConfigurationV1

const configurationV1 = configurationV1Json as ConfigurationV1
const configurationV2 = configurationV2Json as ConfigurationV2
const configurationV3 = configurationV3Json as ConfigurationV3
const configurationV4 = configurationV4Json as ConfigurationV4
const configurationV5 = configurationV5Json as ConfigurationV5

const errors = ErrorsJson as ErrorsV1

const feedback = FeedbackJson as FeedbackV1
const feedbackCreate = FeedbackCreateJson as FeedbackCreateV1
const feedbackCollection = FeedbackCollectionJson as FeedbackCollectionV1
const feedbackListing = FeedbackListingJson as FeedbackListingV1

const interactivePlayer = InteractivePLayerJson as InteractivePlayerV1

const issue = IssueJson as IssueV1
const issueCreate = IssueCreateJson as IssueCreateV1
const issueIndex = IssueIndexJson as IssueIndexV1

const persona1 = Persona1Json as PersonaV1
const persona2 = Persona2Json as PersonaV2

const placeV1 = PlaceV1Json as PlaceV1
const placeV2 = PlaceV2Json as PlaceV2
const placeV3 = PlaceV3Json as PlaceV3
const placeV4 = PlaceV4Json as PlaceV4

const productImage = ProductImageJson as ProductImageV1
const productImageIndex = ProductImageIndexJson as ProductImageIndexV1

const productLookup = ProductLookupJson as ProductLookupV1

const productV1 = ProductV1Json as ProductV1
const productV1Index = ProductV1IndexJson as ProductIndexV1
const productV2 = ProductV2Json as ProductV2
const productV2Index = ProductV2IndexJson as ProductIndexV2

const productVideo = ProductVideoJson as ProductVideoV1
const productVideoIndex = ProductVideoIndexJson as ProductVideoIndexV1

const productListing = ProductsListingJson as ProductListingV1

const pushCampaignTrivialV1 = PushTrivialCampaignV1Json as PushTrivialCampaignV1
const pushCampaignTrivialV2 = PushTrivialCampaignV2Json as PushTrivialCampaignV2
const pushCampaignTrivialV3 = PushTrivialCampaignV3Json as PushTrivialCampaignV3
const pushCampaignTrivialV4 = PushTrivialCampaignV2Json as PushTrivialCampaignV4
const pushCampaignTrivialV5 = PushTrivialCampaignV3Json as PushTrivialCampaignV5
const pushCampaignTrivialV1Create = PushTrivialCampaignV1CreateJson as PushTrivialCampaignCreateV1
const pushCampaignTrivialV2Create = PushTrivialCampaignV2CreateJson as PushTrivialCampaignCreateV2
const pushCampaignTrivialV3Create = PushTrivialCampaignV3CreateJson as PushTrivialCampaignCreateV3
const pushCampaignTrivialV4Create = PushTrivialCampaignV4CreateJson as PushTrivialCampaignCreateV4
const pushCampaignTrivialV5Create = PushTrivialCampaignV5CreateJson as PushTrivialCampaignCreateV5

const pushManifestV1 = PushManifestJson as PushManifestV1

const sentimentFeedback = SentimentFeedbackJson as SentimentFeedbackV1
