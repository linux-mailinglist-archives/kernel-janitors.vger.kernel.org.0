Return-Path: <kernel-janitors+bounces-80-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5380C7DD5F4
	for <lists+kernel-janitors@lfdr.de>; Tue, 31 Oct 2023 19:21:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9971428189A
	for <lists+kernel-janitors@lfdr.de>; Tue, 31 Oct 2023 18:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570A121A0C;
	Tue, 31 Oct 2023 18:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I8MBAcAJ"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADA51DFDE
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 18:21:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E71C433C8;
	Tue, 31 Oct 2023 18:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698776475;
	bh=o18vwaeO2R36/vbyGopKWMEkawn3UVBm6qFsz82W5YI=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=I8MBAcAJPkzoHLFjXMEloJwiM/7wimzAfmbxD83KW+cC7avlJB9q4JQuHfg5LhPyT
	 anBo1h+8CEJJ5qgX0UsK0FgrbQF0r7XJprBgsCoLm531DVwCe4WRYfto6u5jWZiZL7
	 aT3z17ps/46SatgUYjIMd8jPRJe8ZfcAen/zMThUhyb/SlmtcxeTyw9NDm6vDtz29D
	 dZQgq6sS5wlJxs6QgdzepKEu/nnTnJCu2dseeZ62PbXKVHobmrzfMdTqjssa3wytZl
	 NCbW8foBsRd4QEzc42BrgihiaW/LsntsTG+2GiFFxWlB541tE1ZztVaL2QxBdg9h9E
	 GTSytXb6asd9w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 92E30CE0B77; Tue, 31 Oct 2023 11:21:14 -0700 (PDT)
Date: Tue, 31 Oct 2023 11:21:14 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Josh Triplett <josh@joshtriplett.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <quic_neeraju@quicinc.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, rcu@vger.kernel.org
Subject: Re: [PATCH] refscale: Optimize process_durations()
Message-ID: <bcd6bfe1-9891-4f22-86ad-361330e47e9d@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <bbbab32e3e104bdc2238724a6a4a85e539f49ddd.1698512661.git.christophe.jaillet@wanadoo.fr>
 <ozbrmbywamyfkv3amsf2dfdacwmi25serwhc75h6fpsahklsmo@rm43srgxumef>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ozbrmbywamyfkv3amsf2dfdacwmi25serwhc75h6fpsahklsmo@rm43srgxumef>

On Mon, Oct 30, 2023 at 09:55:16AM -0700, Davidlohr Bueso wrote:
> On Sat, 28 Oct 2023, Christophe JAILLET wrote:
> 
> > process_durations() is not a hot path, but there is no good reason to
> > iterate over and over the data already in 'buf'.
> > 
> > Using a seq_buf saves some useless strcat() and the need of a temp buffer.
> > Data is written directly at the correct place.
> 
> Makes sense.
> 
> Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>

Queued and pushed, thank you all!

							Thanx, Paul

