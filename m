Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57ECA7D4874
	for <lists+kernel-janitors@lfdr.de>; Tue, 24 Oct 2023 09:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232420AbjJXHZD (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 24 Oct 2023 03:25:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232396AbjJXHZC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Oct 2023 03:25:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21329A6
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Oct 2023 00:25:00 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8977BB53;
        Tue, 24 Oct 2023 09:24:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698132287;
        bh=h35qdVb87ld4h3tZAHlWww8KZpTygqvvKKcgD+CXG/c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ckgI09Uj/9lrSib1HWJz7XmSSlyJXKFdhkRGLQg8bujTcydTRy1VbSZwabOWfy9On
         3Y7d0hNN8a6gd/ShFj8xJiy6FMI6bjLQsrcbCwqUr7VhaMGHhrjMq6gOD5LA28IY19
         MZjHOduhc0OIhvQUidk3tN7rSXLeA1nA8DNJpa7c=
Date:   Tue, 24 Oct 2023 10:25:06 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     NeilBrown <neilb@suse.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <20231024072506.GC31956@pendragon.ideasonboard.com>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <169809755184.20306.3698252725424588550@noble.neil.brown.name>
 <CAMuHMdUku6U2EMCEXCE_K7bX2XX28P6qXq6ByWvC25C0bVhTOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUku6U2EMCEXCE_K7bX2XX28P6qXq6ByWvC25C0bVhTOw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Geert,

On Tue, Oct 24, 2023 at 09:19:26AM +0200, Geert Uytterhoeven wrote:
> On Mon, Oct 23, 2023 at 11:46 PM NeilBrown wrote:
> > On Tue, 24 Oct 2023, Andrew Morton wrote:
> > > On Thu, 19 Oct 2023 07:11:36 +0300 Dan Carpenter wrote:
> > > > Yesterday someone on my lists just sent an email looking for kernel
> > > > tasks.
> > >
> > > Well here's a task: write a bot which follows the mailing lists and
> > > sends people nastygrams if one of their emails is more than 95%(?)
> > > quoted text.
> >
> > Doesn't your email reader automatically hide most of a large quote?
> > Mine does :-)
> 
> That's part of the problem: many people don't see anymore if the
> previous email author removed irrelevant parts or not.  Until they
> want to reply...
> 
> > > It's happening significantly more lately.  Possibly because the gmail
> > > client helpfully hides quoted text.
> 
> When replying, the Gmail web interface (or Chrome?) is also very
> slow when selecting very long irrelevant parts for deletion.  And it's
> hard to predict when "Show original" and "b4 mbox && alpine -f"
> would be faster...

Get a better e-mail client ? ;-) At least with e-mail you have a choice
between different clients.

I've refrained from replying to this thread so far, as it seemed to be a
caricature of a bikeshedding discussion, but for what it's worth, I
often find myself in the opposite situation when I'm annoyed that
someone trimmed too much of the discussion in their replies.

Yes, replying to a 3000-lines patches with a full quote ana d a
Reviewed-by tag at the very bottom, without any other comment, is
annoying. On the other hand, trimming everything but the few lines to
which you reply means that it gets much more annoying to jump in the
discussion in the middle of a mail thread. There's a difference between
trimming unrelated parts, and removing related content that happens not
to be the direct subject of a particular reply.

-- 
Regards,

Laurent Pinchart
