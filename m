Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B05A15631F
	for <lists+kernel-janitors@lfdr.de>; Sat,  8 Feb 2020 06:55:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbgBHFzC (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 8 Feb 2020 00:55:02 -0500
Received: from sonic305-19.consmr.mail.ir2.yahoo.com ([77.238.177.81]:44351
        "EHLO sonic305-19.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725789AbgBHFzC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 8 Feb 2020 00:55:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1581141299; bh=pa1o5VRYWWG3WgDVzwpWeoz/bqhPAQKm9h7htHGAd9k=; h=Date:From:Reply-To:Subject:References:From:Subject; b=XULBEEEFECzAXF1C1KmAd2+QNZrYU+t213PCpX4GXCISG8PUC8h0sD/vvpGxzCE2NR8O4jzogQ2pdeIhI8voCxYgGs+0CddD6GLDBuwFq7G7lfhfkJRegJXNA1acfzXoOxWs0SvTzs3EQzJ+h0iNk0yCJIPL++8xHI0s66EKdtgk1jg2Zn7qfNWYYEAMp8QfyslMEIb1DKNLRkQLbc67FUVPQ4rD5BQxSoLr5/G3v2vLzTWkXdXSWW6fZce93wJ7yO9UQwcMwC3xWZAE8TBYOAAn6n2okU+doMgRP7edD32MMmWn0SQpstkAm+1iDQyjHlyLN8YvEZp7ELSWzWS7rw==
X-YMail-OSG: zw0A2l8VM1lDoY6SR3TqmNGF07zdLRZBTHc9AFspV0Ex.b.Vx6TZuS2jUUXqE2i
 HxOHhRXjO6Oj4JSihoAZ2OMT.URivVnZ_dBzmpHIF3pstf5MxROBNl4NzgJy5znOXqgWP_5zmacp
 IZpfhMpw.X2PF7Zoi4g5RZfkHe6VezPwROwp3dhvLkDUjZv0HiHTv5eZKs_NaMbZqzyfwKLpGoWf
 1ZxZhMOSo0sEJNA7ObnPtZCbcnmCu1xnx8Qr9KVmwEhxW5qqfK4ALC6lt2YmszLCYGCbtakcIp5z
 4ymEJSl56N7ckqRSLbDhAJX2iB034gubXZBCLeEHzWrDPrSseUF8m3yyIZTWJJRmce1ADxJhekqa
 ElVeBkrFx6Rn5J6Z4trtE4e6sUWGvMdj9H8z6B.ku.C4S9LjCoNvrMQzowrlxLYe_cEMtp6Iwe0_
 .mS9YsQbcoHHcDHTe_t4ve4ykAlKW9.tclWfmHXDX1Pz9fvFs9P186bqL4ScWR79k0BwHbzV4N8L
 A3UqJlOlU.BKKJ6HleT2I1SoAKcDbsd_qnglv2I2EvPP7iMZFitfDO6_OPxwsvPhVm78kRx8IomD
 nDTKG_XypfnOFerx.bMh35_zG_xvzYeH1N7jfPz8yijF6wXMIXjRYlmrgjogYQrpy2p4I8B9meT8
 UZl_nVfc2X5idZ2MlGdujYfEMpojWERIxwFwIgRbijnGuts0jMDpotnGRm7g_YUM9g35gDHQR9Y0
 x1k1V.Qcijyrw4cw2DzG9gLD2j7P_n.LUrBhCjlttz_6XwxKcViKGarxsCTPZkDrhieVoscLMPYP
 bTsNwSgK8L7ptjiKP3257GziNfrsDHPeWayYM6YctVGokm9Pld5qTfb_Y0giAoPw_rtUPBJVCCo1
 XHhsaGQfhjrrkby.ob6YVeuV4JEImo4ku0AAJeHjImdGst4kNgpUOu.nUCRZXXnGCIwPakBcYeKe
 NkvDR85xqpg.YEK7zJRTOtxcIhXsahXn0JK9.MjqWf9kTb4Vtskx3JbKwZc74UQF6UJrcrSDXJTP
 rVnwuY7EpQvLTwE5kWAd2kn5Dqy_3AbGfi7S_ekkM_WARZ6_mJiNbeyL6Bv80OTwg1OkQ4BWSRsF
 P4w2MNPSrGI5zJukFuwGcjUIReCiA3seMy.9Q8Q3Lm44Clx.Ne.wdfAEuM1boNGo0WUISTley.sp
 eHLIVLE4mla2iQooPCz2aXbUjvUdp153gVmh2adilUsBDwInnpDi4t_NPXJWaIghtohCkuExHEfX
 lChycXSQXuu3hsllLgl.TNwyWNy14mU9IzwBWGxNWszSMDuGZ230hby1zc5xmpe0ZO2Rte_g_RZs
 -
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.ir2.yahoo.com with HTTP; Sat, 8 Feb 2020 05:54:59 +0000
Date:   Sat, 8 Feb 2020 05:54:56 +0000 (UTC)
From:   "D.H.L REJOY" <mrsrajoysmrsrajoyshassain@gmail.com>
Reply-To: rejoy_hassain_2020@mail.ru
Message-ID: <88559687.34417.1581141296973@mail.yahoo.com>
Subject: =?UTF-8?Q?Greetings=C2=A0to=C2=A0you.?=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <88559687.34417.1581141296973.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15199 YMailNodin Mozilla/5.0 (Windows NT 5.1; rv:52.0) Gecko/20100101 Firefox/52.0
To:     unlisted-recipients:; (no To-header on input)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

ATTENTION: DEAR BENEFICIARY CONGRATULATIONS TO YOU DEAR GOOD DAY I AM SORRY IF YOU RECEIVED THIS LETTER IN YOUR SPAM OR JUNK MAIL IT IS DUE TO A RECENT CONNECTION HERE IN MY COUNTRY.

DEAR FRIEND.

YOU MAY BE WONDERING WHYI CONTACT YOU BUT SOMEONE LUCKY HAS TO BE CHOSEN WHICH IS YOU. I WANT YOU TO HANDLE THIS BUSINESS TRASACTION WITH ME IF CHANCE YOU TO DO INTERNATION BUSINESS I GO YOUR CONTACT FROM A RELIABLE WEB DIRECTORY.

I RECEIVE YOUR CONTENT OF YOUR EMAIL FROM THIS DHL MASTER CARD OFFICES FUND OF $10.5 USD MILLION AFTER THE BOARD OF DIRECTORS MEETINGS, THE UNITED NATIONS GOVERNMENT HAVE DECIDED TO ISSUE YOU YOUR (ATM) VALUED AT 10.5 MILLION UNITED STATES DOLLAR.THIS IS TO BRING TO YOUR NOTICE THAT YOUR VALUED SUM OF 10.5 MILLION DOLLAR HAS BEING TODAY CREDITED INTO (ATM) MASTER CARD AND HAS BEEN HANDLE TO THE FOREIGN REMITTANCE DEPARTMENT TO SEND IT TO YOU TODAY IN YOUR FAVOR.

WITH YOUR (ATM) YOU WILL HAVE ACCESS TO MAKE DAILY WITHDRAWALS OF $5000,00 UNITED STATE DOLLARS DAILIES AS ALREADY PROGRAMMED UNTIL YOU WITHDRAW YOUR TOTAL SUM IN YOUR (ATM) CARD WHICH HAS REGISTERED IN OUR SYSTEM FOR PAYMENT RECORD, AS SOON AS WE RECEIVE YOUR INFORMATIONS AND YOUR HOME ADDRESS OF YOUR COUNTRY AS ALREADY PROGRAMMED, WE WILL SEND YOUR (ATM) CARD THROUGH DHL COURIER SERVICE, WE HAVE RECEIVED A SIGNAL FROM THE SWISS WORLD BANK TO INFECT YOUR TRANSFER TO YOU WITHIN ONE WEEK,

WE HAVE JUST FINISHED OUR ANNUAL GENERAL MEETING WITH THE CENTRAL BANK OF AMERICA (BOA). AT THE END OF THE BOARD OF DIRECTORS MEETING TODAY, WE HAVE CONCLUDED TO IMMEDIATELY ISSUE YOU AS SOON AS POSSIBLE,

AND YOUR VALUE SUM HAS BEEN CREDITED INTO YOUR (ATM) VISA CARD
ACCOUNT. WHICH YOU WILL USE TO WITHDRAW YOUR FUND IN ANY PART OF THE WORLD, WE HAVE ISSUED AND CREDITED YOUR (ATM) CARD IN YOUR NAME TODAY,

YOUR (ATM) WILL BE INSURE BY THE INSURANCE COMPANY AND SEND TO YOU
THROUGH ANY AVAILABLE COURIER COMPANY OF OUR CHOICE.

ONCE AGAIN CONGRATULATIONS TO YOU,

DIRECTOR DHL SERVICE,
THANKS,
SINCERELY.
MRS. RAJOYS HASSAIN,
