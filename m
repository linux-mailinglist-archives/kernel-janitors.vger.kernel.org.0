Return-Path: <kernel-janitors+bounces-1791-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B537A85ADCC
	for <lists+kernel-janitors@lfdr.de>; Mon, 19 Feb 2024 22:36:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55D231F261B9
	for <lists+kernel-janitors@lfdr.de>; Mon, 19 Feb 2024 21:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4658E54675;
	Mon, 19 Feb 2024 21:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CEfenD8+"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417FA53E08
	for <kernel-janitors@vger.kernel.org>; Mon, 19 Feb 2024 21:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708378577; cv=none; b=aVQUUKDEBruJmHE+tUY/7DOrCw22Pj7GLfNUkx5/e3uwjMZfv5+qDsH5m1+xQNBAi04BTL6Mji3IAa/nLYquLqYh93qlj9KbYFj+pgwCejtRsD8dRLlkVtMFC2YZeA3c8frATys06V5uVTk/DT3tVH3LYY0dkvHF0dXZK1O8HZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708378577; c=relaxed/simple;
	bh=m9hU62GZDlzRYkm5TflwXBi9gQJhj+hqg7sdx9BPbQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oN97sRcWmPbSI3IA2JrwtR2CVRLLUuXgskyGl24VRnzn1DIFR2U+HkxkHn9ekAjn51y1AGvknIQXbhxtxO/YsQ6gxBg5WtYGQ5T9r0yU/yVFTpJCbjnqKp81KZCOgYzLYjzGxwi2Uoq6tIvUTmJehjmjCdXSRZvovJbyQst9lv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CEfenD8+; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 19 Feb 2024 16:36:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1708378573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nHWVuGms67eXElpk+GQbCw/8AGqs4biTimQboa9uwN4=;
	b=CEfenD8+3EJDfCF8/kmLMYKXU6y35aU46WIWwSJJB356+dXfd/9gbPuyr240gOR4UaCLWG
	D71lvlpBHmfECRSHcvmmRB9oo/r/LA4JYFB9GKvYtPeBwKAtm2Vm3vA7kRSO6M82aN3fFD
	KiS4pObDhkHQIzhSjmNJbWzugkqSAx8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Brian Foster <bfoster@redhat.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-bcachefs@vger.kernel.org
Subject: Re: [PATCH v2] bcachefs: Avoid a potential useless over memory
 allocation in bch2_prt_[v]printf()
Message-ID: <csjcyhnh5lhj22emlwdzpr6v4s3mfldsw3um75hsk4ffjsmqmb@otyei3qylhdn>
References: <4c614db674887346ea418acaeafd6bf86502ec77.1708272713.git.christophe.jaillet@wanadoo.fr>
 <pmyezdskyr3t2iyald4diibl6b7lttf46d6sskxfu2wq3pub7r@gmyezjb3wfeu>
 <c745c4d3-a084-440d-bc07-0ecbcfe10e37@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c745c4d3-a084-440d-bc07-0ecbcfe10e37@wanadoo.fr>
X-Migadu-Flow: FLOW_OUT

On Mon, Feb 19, 2024 at 07:10:10PM +0100, Christophe JAILLET wrote:
> Le 19/02/2024 à 04:39, Kent Overstreet a écrit :
> > On Sun, Feb 18, 2024 at 05:12:28PM +0100, Christophe JAILLET wrote:
> > > 2 issues related to incorrect available space in the output buffer
> > > computation may lead to some extra memory allocation.
> > > 
> > > 
> > > First: vsnprintf() takes the size of the buffer, *including* the space for
> > > the trailing null.
> > > 
> > > But printbuf_remaining() returns the number of characters we can print
> > > to the output buffer, *excluding* the terminating null.
> > > 
> > > So, use printbuf_remaining_size(), which includes the space for the
> > > terminating null.
> > 
> > nope, buggy.
> > 
> > passing printbuf_remaining_size() to snprintf() is correct, but
> > snprintf() returns the number of charecters wrote _excluding_ the null
> 
> Hi,
> 
> I think that the patch is correct.

You didn't test it, I did.

In the future, no more patches that you haven't tested - thanks.

> snprintf() returns the number of characters wrote _excluding_ the null. That
> is why the test is: len >= size_of_the_buffer   ==>  more space is needed.
> The case you describe is handled by the == part of >=.
> 
> On the contrary, if len is < size_of_the_buffer, then we have at least 1
> place for the terminating NULL. It will then eventually lead to:
>   len_of_the_string + space_for_'\0' ==  size_of_the_buffer
> So it does not overflow.
> 
> 
> Anyway, feel free to ignore the patch completely if it sounds too risky,
> take only half of it (s/printbuf_remaining/printbuf_remaining_size/) if you
> are more confident with it, or the complete patch if the explanation above
> convinced you.
> 
> From my PoV, the 3 options lead to the same run-time output, with more or
> less memory allocated.
> 
> Best regards.
> 
> CJ
> 
> 
> > 
> > > 
> > > 
> > > Second: if the return value of vsnprintf() is greater than or equal to the
> > > passed size, the resulting string is truncated.
> > > So, in order to see if some extra space is needed, the check needs to be
> > > changed.
> > > 
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > ---
> > > Un-tested
> > > 
> > > v2: - Use printbuf_remaining_size() instead of hand-writing it.  [Brian Foster]
> > >      - Reword the commit log, hoping it is clearer.
> > >      - Synch with -next-20240215
> > > 
> > > v1: https://lore.kernel.org/all/0f40108bed3e084057223bdbe32c4b37f8500ff3.1694845203.git.christophe.jaillet@wanadoo.fr/
> > > ---
> > >   fs/bcachefs/printbuf.c | 10 ++++++----
> > >   1 file changed, 6 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/fs/bcachefs/printbuf.c b/fs/bcachefs/printbuf.c
> > > index b27d22925929..8cee9c2f88c4 100644
> > > --- a/fs/bcachefs/printbuf.c
> > > +++ b/fs/bcachefs/printbuf.c
> > > @@ -55,9 +55,10 @@ void bch2_prt_vprintf(struct printbuf *out, const char *fmt, va_list args)
> > >   		va_list args2;
> > >   		va_copy(args2, args);
> > > -		len = vsnprintf(out->buf + out->pos, printbuf_remaining(out), fmt, args2);
> > > +		len = vsnprintf(out->buf + out->pos, printbuf_remaining_size(out),
> > > +				fmt, args2);
> > >   		va_end(args2);
> > > -	} while (len + 1 >= printbuf_remaining(out) &&
> > > +	} while (len >= printbuf_remaining_size(out) &&
> > >   		 !bch2_printbuf_make_room(out, len + 1));
> > >   	len = min_t(size_t, len,
> > > @@ -72,9 +73,10 @@ void bch2_prt_printf(struct printbuf *out, const char *fmt, ...)
> > >   	do {
> > >   		va_start(args, fmt);
> > > -		len = vsnprintf(out->buf + out->pos, printbuf_remaining(out), fmt, args);
> > > +		len = vsnprintf(out->buf + out->pos, printbuf_remaining_size(out),
> > > +				fmt, args);
> > >   		va_end(args);
> > > -	} while (len + 1 >= printbuf_remaining(out) &&
> > > +	} while (len >= printbuf_remaining_size(out) &&
> > >   		 !bch2_printbuf_make_room(out, len + 1));
> > >   	len = min_t(size_t, len,
> > > -- 
> > > 2.43.2
> > > 
> > 
> > 
> 

