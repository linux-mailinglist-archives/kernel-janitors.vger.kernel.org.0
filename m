Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 875A4729EF1
	for <lists+kernel-janitors@lfdr.de>; Fri,  9 Jun 2023 17:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241530AbjFIPoQ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 9 Jun 2023 11:44:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241915AbjFIPn6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 9 Jun 2023 11:43:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05CDD359A;
        Fri,  9 Jun 2023 08:43:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8EC676118E;
        Fri,  9 Jun 2023 15:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D937CC433D2;
        Fri,  9 Jun 2023 15:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686325429;
        bh=B61Wo/LrDh17523r7GvqgHZ1Du9c2pqzypJ7M73gABY=;
        h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
        b=SCKpoiEdPFMMrYaC2ogJjoGPyTEQ+bgWbBs3W50tte0JILjCW9vzoyarrAlf+Xq/g
         o6V1F+sUWwDW65Zm00dmW+BwKO4HIY3mi4ZeZWTQvSu92xbW8+zU1sHagTUYRuO0DV
         UkhG0nZq4mQ70YuKs/Z6XYwCueEhnKoFvjguPzSvtTtanVse7/Dkq06ptj5QW3Om6H
         6ClPWgZFRl+/iUQSkIXKC4itkrj7ZArEUJOMGdPs8Cq/IYk4RY4Gh6+gNtGsRDfDms
         p0brrg8Um8GZr7BO1RHL7NICLC3mhYWAq4VVDjMxUAIsaIeHxna8dEyb/egrq72Xa8
         9sUPEY0Jf5yEg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 09 Jun 2023 18:43:41 +0300
Message-Id: <CT88H06LDAO8.11HDWH3WK8N5Q@suppilovahvero>
To:     "Jarkko Sakkinen" <jarkko@kernel.org>,
        "Dan Carpenter" <dan.carpenter@linaro.org>
Cc:     "Bagas Sanjaya" <bagasdotme@gmail.com>,
        "Franziska Naepelt" <franziska.naepelt@googlemail.com>,
        <keyrings@vger.kernel.org>, <dhowells@redhat.com>,
        <dwmw2@infradead.org>, <linux-kernel@vger.kernel.org>,
        "Franziska Naepelt" <franziska.naepelt@gmail.com>,
        "kernel test robot" <lkp@intel.com>,
        "Linux SPDX Licenses" <linux-spdx@vger.kernel.org>,
        "Linux Kernel Janitors" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH v2] certs/extract-cert: Fix checkpatch issues
From:   "Jarkko Sakkinen" <jarkko@kernel.org>
X-Mailer: aerc 0.14.0
References: <20230601190508.56610-1-franziska.naepelt@gmail.com>
 <20230602085902.59006-1-franziska.naepelt@gmail.com>
 <ZH8mhIrjyBvTF4oZ@debian.me>
 <e39efb7f-5d8f-4433-83b3-8eea8a6c0486@kadam.mountain>
 <CT5NH4XXIYQF.5XXJE6JA5FZP@suppilovahvero>
 <c464c4ee-038c-47bf-857a-b11a89680e82@kadam.mountain>
 <CT88CCOYEZ1Z.12FUJMD15YPR@suppilovahvero>
In-Reply-To: <CT88CCOYEZ1Z.12FUJMD15YPR@suppilovahvero>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri Jun 9, 2023 at 6:37 PM EEST, Jarkko Sakkinen wrote:
> On Fri Jun 9, 2023 at 5:01 PM EEST, Dan Carpenter wrote:
> > On Tue, Jun 06, 2023 at 05:51:09PM +0300, Jarkko Sakkinen wrote:
> > > It's not a "punishment". It's more like that I really have to take th=
e
> > > time to read the prose...
> >
> > The thing about imperative tense is that it was used as a punishment on
> > me once five years ago.  I wrote a quite bad commit message and a senio=
r
> > maintainer told me to re-write it properly and I realized that it was
> > true.  My commit message was bad.  So I wrote a proper commit message.
> > And then he yelled at me, "Can't you follow simple directions and write
> > it in imperative tense like the documentation says?  Are you a
> > shithead?"
>
> Wow :-O I'm totally against name calling or any sort of shittiness like
> that, and all for co-operation. Just told my personal thoughts on the
> matter. I'm sorry that this happened to you.
>
> >
> > So then I swore I would never talk to him again or to anyone who
> > enforced the imperative tense rule.  That has only happened once in the
> > intervening years.  I told the maintainer, "Fine.  Re-write the commit
> > message however you like and give me Reported-by credit."  This was a
> > cheeky response and it made the maintainer enraged.  I guess he thought
> > that my boss would force me to fix the bug or something?  I felt bad fo=
r
> > the Intel developer who had to fix my bug instead because I knew that
> > the maintainer was going to be super angry if he gave me reported-by
> > credit so I had put him in a bind.  I almost re-wrote the commit messag=
e
> > so that he wouldn't have to deal with that.  Maybe this is how mothers
> > feel when they try to take abuse from an angry husband instead of
> > letting their kids suffer.  But I am a bad mother and I left.
> >
> > My boss would never have forced me to deal with that.  When he left for
> > a different company he said, "Dan, I'm transitioning and XXX is taking
> > over me and I have told him all your weirdness so he is prepared."  And
> > it was a huge comfort to me because I know what my weakness are.
> >
> > You people on this thread all seem super nice.  And you're right that w=
e
> > should always try to be improve every aspect of our craft.
> >
> > When Jarkko talked about people who write too long commit messages, I
> > thought about one developer in particular who writes too long commit
> > messages.  He writes in imperative tense.  He takes everything so
> > seriously and he's never seen a rule without following it.  His patches
> > are always right.  People have told him that his commit messages are ba=
d
> > and too long and those people are right.  But they need to shut up.  Th=
e
> > good things that he does and the bad things that he does are all part o=
f
> > the same package.  He can't change and I don't want him to feel anythin=
g
> > but welcome.
> >
> > It's hard to be a good kernel developer without being at least slightly
> > obsessive.  Both developers and maintainers are that way.  And I deal
> > with a lot of people and accomodating maintainers you disagree with is
> > part of the job.
> >
> > So long as everyone is kind to each other.  That's the main thing.
>
> I 110% agree with this. I even bookmarked this response :-)

To add: it is super hard and non-trivial issue to keep the balance
between "nice" and "obsessive". If you are too nice, the stuff does not
get fixed. If you are too obssesive, well... then you act like a jerk.
So you have to try to say the truth as clearly as possible, but still
keep the tone constructive. Not always easy to manage.

Personally, I keep bullshit threshold from other people. There are
better and worse days and that does affect your communication. So if
you get one nastier email from someone 9/10 it is better just ignore
the bullshit and focus on matter. Of course when it is a trend, then
it is better to vocally ask for better communication.

BR, Jarkko
