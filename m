Return-Path: <kernel-janitors+bounces-1154-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59124827F91
	for <lists+kernel-janitors@lfdr.de>; Tue,  9 Jan 2024 08:40:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED109B2522A
	for <lists+kernel-janitors@lfdr.de>; Tue,  9 Jan 2024 07:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A1725750;
	Tue,  9 Jan 2024 07:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OqdyB/+j"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612DE6D6E2
	for <kernel-janitors@vger.kernel.org>; Tue,  9 Jan 2024 07:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-336c9acec03so2546196f8f.2
        for <kernel-janitors@vger.kernel.org>; Mon, 08 Jan 2024 23:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704785996; x=1705390796; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FCGnpiVOUgVBf9FWkplPUtkcGPH1yZ1U7MpKIuVpA0s=;
        b=OqdyB/+jfheR41GiV1sV/u3R4imyL91OuwPqYFcPfK4JSBX2Onjuyl3lHdAdXgfvnL
         uQn+dB1janbiYi5IkKbfum7xHUR7zPlDOTwCrXuGGCMh2zdxEc9sBvsUMhVOQuWXhEb7
         wCdqlUEZZrdbNm3NGRlin56i5qP898KAoMoBUzvVrG8tHLGhWxQR836v2qr2Ba1XURky
         i2QX4NprTJY9izIWhDmStqH854Jrqt8nLgeUTuyQ+4JZWQ8X9JfVXxaTMs676pOEAClZ
         iPnRQAl5+Wz1oJ+JoaNnfX1SNgTbfWBeWjxkA5oreiA1USaTMWcX4Aoz6w0zAYvK+L2A
         MqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704785996; x=1705390796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCGnpiVOUgVBf9FWkplPUtkcGPH1yZ1U7MpKIuVpA0s=;
        b=dwApVUHDqn1XXO1xHrmgVSvsiLLXocvDD96O/yU7bJgO3HdxiY54d3BYKkxFq+MafL
         iw0lvKBJSrHHQ3JLVkprTWE8uVpu4+v6/BgRZ9VO2EpxkFkDznrY6eyuVdcu8NQewqQR
         TeVyaocoZc0PHiO8QbbnOpeDnwUzwgzwAiUwMEnTdB95W1ILAH0Sba5uuaI6ST0gXmsz
         Azm5Qi6cW6CwS4nb3qqUvXj+UWLYLpdtLcxXM7e52q5j3DSNulrDFGj0dC/uzOXtVOyq
         ATG4nHwcyOZ/VO236bO/meoWkeHpYdLPgbrv8KL8Imqp6Bx8b0xvi0sI+Rc++Xb1wUss
         6xNg==
X-Gm-Message-State: AOJu0YyeIBCmf4KsqDPrRllWUclxgtisg62/d2tW0sNpNiqr1Rea9sAM
	0rajtO0XYwVtQ8bkSYYk7SV/rZWwG0ItxA==
X-Google-Smtp-Source: AGHT+IEvk3ncbEGc3LkVgi8d+aEnFalCwAwKUCaY4/yteX7pPp3uVJedSRrAiFOv8VuIvMhiRNJVSA==
X-Received: by 2002:a5d:5966:0:b0:337:6535:3642 with SMTP id e38-20020a5d5966000000b0033765353642mr336509wri.43.1704785996635;
        Mon, 08 Jan 2024 23:39:56 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id k14-20020a5d6e8e000000b003366c058509sm1618608wrz.23.2024.01.08.23.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 23:39:56 -0800 (PST)
Date: Tue, 9 Jan 2024 10:39:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.com>,
	Ronnie Sahlberg <lsahlber@redhat.com>,
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/3] cifs: make cifs_chan_update_iface() a void function
Message-ID: <5c29dddd-2952-4993-9347-7bb11bdf2914@moroto.mountain>
References: <b628a706-d356-4629-a433-59dfda24bb94@moroto.mountain>
 <eac139a7-76d4-4067-8c25-15e30692aaf9@moroto.mountain>
 <4c6b12c9-0502-400a-b2ba-dad89ef4f652@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c6b12c9-0502-400a-b2ba-dad89ef4f652@wanadoo.fr>

On Mon, Jan 08, 2024 at 08:09:17PM +0100, Christophe JAILLET wrote:
> > @@ -478,13 +475,13 @@ cifs_chan_update_iface(struct cifs_ses *ses, struct TCP_Server_Info *server)
> >   	chan_index = cifs_ses_get_chan_index(ses, server);
> >   	if (chan_index == CIFS_INVAL_CHAN_INDEX) {
> >   		spin_unlock(&ses->chan_lock);
> > -		return 0;
> > +		return;
> >   	}
> >   	ses->chans[chan_index].iface = iface;
> >   	spin_unlock(&ses->chan_lock);
> > -	return rc;
> > +	return;
> 
> just remove this one?
> 

Doh.  Yeah.  I'll send a v2 of this tomorrow.

regards,
dan carpenter


