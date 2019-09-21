import {AudioFragmentIndexV1, AudioFragmentV1 } from '../application/vnd.trailervote.audio_fragment'
import {CarouselV1} from '../application/vnd.trailervote.carousel'
import {ClientConfigurationV1} from '../application/vnd.trailervote.client_configuration'
import {ConfigurationV1, ConfigurationV2} from '../application/vnd.trailervote.configuration'
import { ErrorsV1 } from '../application/vnd.trailervote.errors'
import { FeedbackV1, FeedbackCreateV1, FeedbackCollectionV1 } from '../application/vnd.trailervote.feedback'
import { FeedbackListingV1 } from '../application/vnd.trailervote.feedback_listing'
import { InteractivePlayerV1 } from '../application/vnd.trailervote.interactive_player'
import { IssueCreateV1, IssueIndexV1, IssueV1 } from '../application/vnd.trailervote.issue'
import { PersonaV1 } from '../application/vnd.trailervote.persona'
import { PlaceV1, PlaceV2, PlaceV3 } from '../application/vnd.trailervote.place'
import { ProductImageV1, ProductImageIndexV1 } from '../application/vnd.trailervote.product.image'
import { ProductLookupV1 } from '../application/vnd.trailervote.product.lookup'
import { ProductV1, ProductV2, ProductIndexV1, ProductIndexV2 } from '../application/vnd.trailervote.product'
import { ProductVideoV1, ProductVideoIndexV1 } from '../application/vnd.trailervote.product.video'



import audioJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.audio_fragment.v1.json'
import audioIndexJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.audio_fragment.v1.index.json'
import audioOrderedJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.audio_fragment.v1.ordered.json'
import carouselJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.carousel.v1.json'
import clientConfigurationJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.client_configuration.v1.json'
import configurationV1Json from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.configuration.v1.json'
import configurationV2Json from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.configuration.v2.json'
import ErrorsJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.errors.v1.json'
import FeedbackJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.feedback.v1.json'
import FeedbackCreateJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.feedback.v1.create.json'
import FeedbackCollectionJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.feedback.v1.collection.json'
import FeedbackListingJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.feedback_listing.v1.json'
import InteractivePLayerJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.interactive_player.v1.json'
import IssueJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.issue.v1.json'
import IssueCreateJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.issue.v1.create.json'
import IssueIndexJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.issue.v1.index.json'
import PersonaJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.persona.v1.json'
import PlaceV1Json from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.place.v1.json'
import PlaceV2Json from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.place.v2.json'
import PlaceV3Json from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.place.v3.json'
import ProductImageJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.product.image.v1.json'
import ProductImageIndexJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.product.image.v1.index.json'
import ProductLookupJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.product.lookup.v1.json'
import ProductV1Json from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.product.v1.json'
import ProductV1IndexJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.product.v1.index.json'
import ProductV2Json from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.product.v2.json'
import ProductV2IndexJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.product.v2.index.json'
import ProductVideoJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.product.video.v1.json'
import ProductVideoIndexJson from '@trailervote/fixtures/lib/trailer_vote/fixtures/application/vnd.trailervote.product.video.v1.index.json'




// Fixtures can not be imported with their original names.
// Run yarn fix-fixtures to fix their names

const audio = audioJson as AudioFragmentV1
const audioIndex = audioIndexJson as AudioFragmentIndexV1
const audioOrdered = audioOrderedJson // TODO: missing in Typescript

const carousel = carouselJson as CarouselV1

const clientConfiguration = clientConfigurationJson as ClientConfigurationV1

const configurationV1 = configurationV1Json as ConfigurationV1
const configurationV2 = configurationV2Json as ConfigurationV2

const errors = ErrorsJson as ErrorsV1

const feedback = FeedbackJson as FeedbackV1
const feedbackCreate = FeedbackCreateJson as FeedbackCreateV1
const feedbackCollection = FeedbackCollectionJson as FeedbackCollectionV1
const feedbackListing = FeedbackListingJson as FeedbackListingV1

const interactivePlayer = InteractivePLayerJson as InteractivePlayerV1

const issue = IssueJson as IssueV1
const issueCreate = IssueCreateJson as IssueCreateV1
const issueIndex = IssueIndexJson as IssueIndexV1

const person = PersonaJson as PersonaV1

const placeV1 = PlaceV1Json as PlaceV1
const placeV2 = PlaceV2Json as PlaceV2
const placeV3 = PlaceV3Json as PlaceV3

const productImage = ProductImageJson as ProductImageV1
const productImageIndex = ProductImageIndexJson as ProductImageIndexV1

const productLookup = ProductLookupJson as ProductLookupV1

const ProductV1 = ProductV1Json as ProductV1
const ProductV1Index = ProductV1IndexJson as ProductIndexV1
const ProductV2 = ProductV2Json as ProductV2
const ProductV2Index = ProductV2IndexJson as ProductIndexV2

const ProductVideo = ProductVideoJson as ProductVideoV1
const ProductVideoIndex = ProductVideoIndexJson as ProductVideoIndexV1